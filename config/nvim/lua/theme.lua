------------------------------- Theme ------------------------------

vim.go.t_Co = '256'
vim.cmd('colorscheme onehalfdark')
vim.g['airline_theme'] = 'onehalfdark'

vim.cmd[[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
]]
