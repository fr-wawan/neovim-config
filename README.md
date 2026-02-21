# Neovim Config

lazy.nvim-based config.

## Keybindings (most used)

Leader is `<Space>`.

### Files/Search (Telescope)

- `<C-p>`: Find files
- `<leader>sf`: Find files
- `<leader>sg`: Live grep
- `<leader>sw`: Search word under cursor
- `<leader>sR`: Recent files (telescope-recent-files)
- `<leader><leader>`: Buffers
- `<leader>/`: Fuzzy search in current buffer

### Windows/Buffers

- `<C-h/j/k/l>`: Move focus
- `<leader>v`: Vertical split
- `<leader>h`: Horizontal split
- `<leader>=`: Equalize splits
- `<leader>x`: Close window
- `<S-h>/<S-l>`: Prev/next buffer
- `<leader>bd`: Delete buffer
- `<leader>bo`: Close other buffers

### Editing

- `jj`: Exit insert mode
- Visual `J/K`: Move selection down/up
- `<leader>p`: Paste without overwriting register
- `<leader>y` / `<leader>Y`: Yank to system clipboard
- `<leader>d`: Delete to void register
- `<leader>rr`: Replace word (case-aware, via vim-abolish)

### LSP/Diagnostics

- `gj`: Go to definition (Telescope)
- `grr`: References (Telescope)
- `gri`: Implementation (Telescope)
- `grt`: Type definition (Telescope)
- `grn`: Rename
- `<leader>ca`: Code action
- `gl`: Line diagnostics float
- `[d` / `]d`: Prev/next diagnostic
- `<leader>q`: Diagnostics to loclist
- `<leader>Q`: Diagnostics to quickfix

### Formatting

- `<leader>f`: Format buffer (conform)

### Git (gitsigns)

- `]c` / `[c`: Next/prev hunk
- `<leader>hp`: Preview hunk
- `<leader>hs`: Stage hunk
- `<leader>hr`: Reset hunk
- `<leader>tb`: Toggle blame

### Trouble

- `<leader>xx`: Diagnostics list
- `<leader>xq`: Quickfix list
- `<leader>xl`: Loclist

### File manager

- `<leader>e`: Yazi

### Terminal

- `<C-\\>`: Toggle terminal split
- Terminal `<Esc><Esc>`: Exit terminal mode

### AI

- `<M-CR>`: Copilot accept

### QoL

- `<leader>u`: UndoTree toggle
- `]r` / `[r`: Next/prev reference highlight
