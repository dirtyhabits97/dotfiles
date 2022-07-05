------------------------------- Mappings ------------------------------

-- Leader key
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap

map('n', '<C-n>', [[:NERDTreeToggle<cr>]], { noremap = true })
map('n', '<C-m>', [[:NERDTreeFind<cr>]], { noremap = true })

-- Easier code comment
map('n', '<C-_>', [[<Plug>NERDCommenterToggle]], {})
map('v', '<C-_>', [[<Plug>NERDCommenterToggle<Bar>gv]], {})

-- Easier write and quit
vim.api.nvim_create_user_command(
  'W', [[write]], { nargs = 0 }
)
vim.api.nvim_create_user_command(
  'Q', [[quit]], { nargs = 0 }
)
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

-- Custom commands
vim.api.nvim_create_user_command(
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

-- TODO: implement this
-- vim.api.nvim_create_user_command(
--   'Config',
--   function()
--     vim.api.ope
--   end,
--   { nargs = 0 }
-- )
