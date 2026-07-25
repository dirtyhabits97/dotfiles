-- Colorscheme, picked by `bin/theme` via ~/.local/state/theme.
-- Keys match the alacritty theme file names in config/alacritty/themes/.
local themes = {
  ['catppuccin-mocha'] = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      transparent_background = true, -- let alacritty opacity show through
    })
    return 'catppuccin-mocha'
  end,
  ['tokyo-night'] = function()
    require('tokyonight').setup({ transparent = true })
    return 'tokyonight-night'
  end,
}

local state = vim.fn.expand('~/.local/state/theme')
local name = vim.fn.filereadable(state) == 1 and vim.trim(vim.fn.readfile(state)[1] or '') or ''

vim.cmd('colorscheme ' .. (themes[name] or themes['catppuccin-mocha'])())

vim.cmd[[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
]]
