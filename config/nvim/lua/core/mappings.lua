------------------------------- Mappings ------------------------------

-- Leader key
vim.g.mapleader = " "

local command = vim.api.nvim_create_user_command
local map = vim.api.nvim_set_keymap

map('n', '<C-n>', [[:NERDTreeToggle<cr>]], { noremap = true })
map('n', '<C-m>', [[:NERDTreeFind<cr>]], { noremap = true })

-- Easier code comment
map('n', '<C-_>', [[<Plug>NERDCommenterToggle]], {})
map('v', '<C-_>', [[<Plug>NERDCommenterToggle<Bar>gv]], {})

-- Easier write and quit
command('W', [[write]], { nargs = 0 })
command('Q', [[quit]], { nargs = 0 })
map('c', 'Wq', 'wq', {})
map('c', 'WQ', 'wq', {})

-- Easier escape
map('i', 'jj', '<ESC>', { noremap = true })
map('i', 'kk', '<ESC>', { noremap = true })

-- Easier navigation with wrapped lines
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })

-- Easier navigation between buffers
map('n', '<leader>1', [[:bp<cr>]], {})
map('n', '<leader>2', [[:bn<cr>]], {})

-- Easier merge solving with fugitive
map('n', '<leader>gj', [[:diffget //3<CR>]], {})
map('n', '<leader>gf', [[:diffget //2<CR>]], {})

-- Easier resize
map('n', '<silent><leader>=', [[:exe "vertical resize +5"<CR>]], { noremap = true })
map('n', '<silent><leader>-', [[:exe "vertical resize -5"<CR>]], { noremap = true })

-- Easier FZF
map('n', '<leader>ff', [[:GFiles<cr>]], { noremap = true })
map('n', '<leader>fg', [[:Rg<cr>]], { noremap = true })
map('n', '<leader>fb', [[:Buffers<cr>]], { noremap = true })
map('n', '<leader>fh', [[:HelpTags<cr>]], { noremap = true })

-- Easier Trouble
map('n', '<C-x>', [[:TroubleToggle<cr>]], { noremap = true })

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
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'Config',
  function()
    vim.cmd [[:edit ~/.config/nvim/lua/core/mappings.lua]]
  end,
  { nargs = 0 }
)
