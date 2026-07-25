------------------------------- Mappings ------------------------------

-- Helpers
local cmap = function(alias, cmd)
  vim.api.nvim_set_keymap('c', alias, cmd, {})
end

local nmap = function(alias, cmd)
  vim.api.nvim_set_keymap('n', alias, cmd, {})
end

local vmap = function(alias, cmd)
  vim.api.nvim_set_keymap('v', alias, cmd, {})
end

local inoremap = function(alias, cmd)
  vim.api.nvim_set_keymap('i', alias, cmd, { noremap = true })
end

local nnoremap = function(alias, cmd)
  vim.api.nvim_set_keymap('n', alias, cmd, { noremap = true })
end

local command = function(name, f)
  vim.api.nvim_create_user_command(name, f, { nargs = 0 })
end

-- Leader key
vim.g.mapleader = " "

nnoremap('<C-n>', [[:NvimTreeToggle<cr>]])
nnoremap('<C-m>', [[:NvimTreeFindFileToggle<cr>]])

-- Easier code comment
nmap('<C-_>', [[<Plug>NERDCommenterToggle]])
vmap('<C-_>', [[<Plug>NERDCommenterToggle<Bar>gv]])

-- Easier write and quit
command('W', [[write]])
command('Q', [[quit]])
cmap('Wq', 'wq')
cmap('WQ', 'wq')

-- Easier escape
inoremap('jj', '<ESC>')
inoremap('kk', '<ESC>')

-- Easier navigation with wrapped lines
nnoremap('j', 'gj')
nnoremap('k', 'gk')

-- Easier navigation between buffers
nmap('<leader>1', [[:bp<cr>]])
nmap('<leader>2', [[:bn<cr>]])

-- Easier merge solving with fugitive
nmap('<leader>gj', [[:diffget //3<CR>]])
nmap('<leader>gf', [[:diffget //2<CR>]])

-- Easier resize
nnoremap('<silent><leader>=', [[:exe "vertical resize +5"<CR>]])
nnoremap('<silent><leader>-', [[:exe "vertical resize -5"<CR>]])

-- Easier FZF
nnoremap('<leader>fb', [[:Telescope buffers<cr>]])
nnoremap('<leader>fd', [[:Telescope diagnostics bufnr=0<cr>]])
nnoremap('<leader>ff', [[:Telescope find_files<cr>]])
nnoremap('<leader>fg', [[:Telescope live_grep<cr>]])
nnoremap('<leader>fr', [[:Telescope lsp_references<cr>]])
nnoremap('<leader>fs', [[:Telescope lsp_document_symbols<cr>]])
nnoremap('<leader>ft', [[:TodoTelescope keywords=TODO,FIX<cr>]])

-- Yank paths to the system clipboard (like vifm's `yd` / `yf`)
-- Leader-prefixed so bare `yf<char>` still works as yank-to-char.
vim.keymap.set("n", "<leader>yd", function()
  vim.fn.setreg('+', vim.fn.expand('%:p:h'))
end, { desc = "Yank directory path" })

vim.keymap.set("n", "<leader>yf", function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
end, { desc = "Yank file path" })

-- Preview hunk from gitsigns
nnoremap('<leader>gb', [[:Git blame<cr>]])
nnoremap('<leader>gp', [[:Gitsigns preview_hunk<cr>]])

-- Toggle lsp_lines (deferred to avoid loading plugin at startup)
vim.keymap.set(
  "",
  "<leader>l",
  function() require('lsp_lines').toggle() end,
  { desc = "Toggle lsp_lines" }
)

-- Jump between todo comments

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
