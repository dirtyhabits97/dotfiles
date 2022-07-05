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

nnoremap('<C-n>', [[:NERDTreeToggle<cr>]])
nnoremap('<C-m>', [[:NERDTreeFind<cr>]])

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
nnoremap('<leader>ff', [[:GFiles<cr>]])
nnoremap('<leader>fg', [[:Rg<cr>]])
nnoremap('<leader>fb', [[:Buffers<cr>]])
nnoremap('<leader>fh', [[:HelpTags<cr>]])

-- Easier Trouble
nnoremap('<C-x>', [[:TroubleToggle<cr>]])

-- Custom commands
command(
  'Reload',
  function()
    for name, _ in pairs(package.loaded) do
      if name:match('^core') or name:match('^extension') then
        package.loaded[name] = nil
      end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify('Nvim coniguration reloaded!', vim.log.levels.INFO)
  end
)

command(
  'Config',
  function()
    vim.cmd [[:edit ~/.config/nvim/lua/core/mappings.lua]]
  end
)
