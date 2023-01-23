------------------------------- Mappings ------------------------------

local keymap = require('utils.keymap')

-- Leader key
vim.g.mapleader = " "

keymap.nnoremap('<C-n>', [[:NERDTreeToggle<cr>]])
keymap.nnoremap('<C-m>', [[:NERDTreeFind<cr>]])

-- Easier code comment
keymap.nmap('<C-_>', [[<Plug>NERDCommenterToggle]])
keymap.vmap('<C-_>', [[<Plug>NERDCommenterToggle<Bar>gv]])

-- Easier write and quit
keymap.command('W', [[write]])
keymap.command('Q', [[quit]])
keymap.cmap('Wq', 'wq')
keymap.cmap('WQ', 'wq')

-- Easier escape
keymap.inoremap('jj', '<ESC>')
keymap.inoremap('kk', '<ESC>')

-- Easier navigation with wrapped lines
keymap.nnoremap('j', 'gj')
keymap.nnoremap('k', 'gk')

-- Easier navigation between buffers
keymap.nmap('<leader>1', [[:bp<cr>]])
keymap.nmap('<leader>2', [[:bn<cr>]])

-- Easier merge solving with fugitive
keymap.nmap('<leader>gj', [[:diffget //3<CR>]])
keymap.nmap('<leader>gf', [[:diffget //2<CR>]])

-- Easier resize
keymap.nnoremap('<silent><leader>=', [[:exe "vertical resize +5"<CR>]])
keymap.nnoremap('<silent><leader>-', [[:exe "vertical resize -5"<CR>]])

-- Easier Telescope
keymap.nnoremap('<leader>ff', [[:Telescope find_files<cr>]])
keymap.nnoremap('<leader>fg', [[:Telescope live_grep<cr>]])
keymap.nnoremap('<leader>fb', [[:Telescope buffers<cr>]])
keymap.nnoremap('<leader>fh', [[:Telescope lsp_document_symbols<cr>]])

-- Easier Trouble
keymap.nnoremap('<C-x>', [[:TroubleToggle<cr>]])

-- Preview hunk from gitsigns
keymap.nnoremap('<leader>hp', [[:Gitsigns preview_hunk<cr>]])

-- TODO: use one of the helpers
vim.keymap.set(
  "",
  "<leader>l",
  require('lsp_lines').toggle,
  { desc = "Toggle lsp_lines" }
)
