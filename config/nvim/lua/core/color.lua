-- vim.go.t_Co = '256'
require('tokyonight').setup({ transparent = true }) -- let alacritty opacity show through
vim.cmd('colorscheme tokyonight-night')

vim.cmd[[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
]]
