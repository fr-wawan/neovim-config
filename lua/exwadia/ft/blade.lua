local M = {}

local uv = vim.uv or vim.loop

local function is_dir(p)
  local st = uv.fs_stat(p)
  return st and st.type == 'directory'
end

local function file_exists(p)
  local st = uv.fs_stat(p)
  return st and st.type == 'file'
end

local function find_views_root(start_file)
  local dir = vim.fn.fnamemodify(start_file, ':p:h')
  while dir and dir ~= '/' do
    local candidate = dir .. '/resources/views'
    if is_dir(candidate) then
      return candidate
    end
    dir = vim.fn.fnamemodify(dir, ':h')
  end
  return nil
end

local function supports_definition(bufnr)
  for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
    if client.supports_method and client:supports_method 'textDocument/definition' then
      return true
    end
    local caps = client.server_capabilities or {}
    if caps.definitionProvider ~= nil then
      return true
    end
  end
  return false
end

local function string_at_cursor(line, col)
  local i = col + 1
  for _, q in ipairs { "'", '"' } do
    local l
    for j = i, 1, -1 do
      local ch = line:sub(j, j)
      if ch == q and line:sub(j - 1, j - 1) ~= '\\' then
        l = j
        break
      end
    end
    if l then
      local r
      for j = i + 1, #line do
        local ch = line:sub(j, j)
        if ch == q and line:sub(j - 1, j - 1) ~= '\\' then
          r = j
          break
        end
      end
      if r and l < i + 1 and r >= i + 1 then
        return line:sub(l + 1, r - 1), line:sub(1, l - 1)
      end
    end
  end

  return nil, nil
end

local function view_or_component_under_cursor(line, col)
  local inside, before = string_at_cursor(line, col)
  if inside and before then
    if
      before:match '@include%w*%s*%($'
      or before:match '@extends%w*%s*%($'
      or before:match '@component%w*%s*%($'
      or before:match '@each%w*%s*%($'
      or before:match '@includeIf%w*%s*%($'
      or before:match '@includeWhen%w*%s*%($'
      or before:match '@includeFirst%w*%s*%($'
      or before:match 'view%s*%($'
    then
      return { kind = 'view', token = inside }
    end
  end

  local left = line:sub(1, col + 1)
  local start_idx = left:match '.*()<x[%w%-%._:]*'
  if start_idx then
    local after = line:sub(start_idx + 1)
    local name = after:match '^<([xX][%w%-%._:]+)'
    if name then
      return { kind = 'component', token = name }
    end
  end

  return nil
end

local function normalize_token(s)
  return (s or ''):gsub('^[\'"]', ''):gsub('[\'"]$', '')
end

local function first_glob_match(pattern)
  local matches = vim.fn.glob(pattern, false, true)
  if matches and #matches > 0 then
    return matches[1]
  end
  return nil
end

local function view_path(views_root, token)
  local rel = token:gsub('%.', '/')
  local p1 = ('%s/%s.blade.php'):format(views_root, rel)
  local p2 = ('%s/%s.php'):format(views_root, rel)
  if file_exists(p1) then
    return p1
  end
  if file_exists(p2) then
    return p2
  end
  return first_glob_match(('%s/%s*.blade.php'):format(views_root, rel))
    or first_glob_match(('%s/%s*/index.blade.php'):format(views_root, rel))
    or first_glob_match(('%s/%s*.php'):format(views_root, rel))
end

local function component_path(views_root, tag)
  local name = tag:gsub('^x[-:]', ''):gsub('^x', ''):gsub('::', '/'):gsub('%.', '/')
  local rel = 'components/' .. name
  local p1 = ('%s/%s.blade.php'):format(views_root, rel)
  if file_exists(p1) then
    return p1
  end
  return first_glob_match(('%s/%s*.blade.php'):format(views_root, rel)) or first_glob_match(('%s/%s*/index.blade.php'):format(views_root, rel))
end

local function blade_gd()
  local bufnr = vim.api.nvim_get_current_buf()

  if supports_definition(bufnr) then
    vim.lsp.buf.definition()
    return
  end

  local file = vim.api.nvim_buf_get_name(bufnr)
  local views_root = find_views_root(file)
  if not views_root then
    vim.notify("Blade: couldn't locate resources/views", vim.log.levels.WARN)
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)[1] or ''
  local info = view_or_component_under_cursor(line, col)
  if not info then
    vim.notify('Blade: no view/component under cursor', vim.log.levels.WARN)
    return
  end

  local token = normalize_token(info.token)
  local path
  if info.kind == 'view' then
    path = view_path(views_root, token)
  else
    path = component_path(views_root, token)
  end

  if not path then
    vim.notify(("Blade: view not found for '%s'"):format(token), vim.log.levels.WARN)
    return
  end

  vim.cmd('edit ' .. vim.fn.fnameescape(path))
end

function M.setup(bufnr)
  vim.keymap.set('n', 'gd', blade_gd, {
    buffer = bufnr,
    silent = true,
    desc = 'Go to definition (Blade-aware)',
  })
end

return M
