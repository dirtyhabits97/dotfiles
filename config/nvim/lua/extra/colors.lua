------------------------------- Theme ------------------------------

vim.go.t_Co = '256'
vim.cmd('colorscheme onehalfdark')

vim.cmd[[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
]]

-- Override colors
-- TODO: do we want this anymore?
-- vim.cmd[[
--   highlight Pmenu       guibg=#2c323c guifg=#dcdfe4
--   highlight PmenuSel    guibg=#4b5263
--   highlight PmenuSbar   guibg=#24282c
--   highlight PmenuThumb  guibg=#abb2bf
-- ]]

-- Colorizer
require'colorizer'.setup()
