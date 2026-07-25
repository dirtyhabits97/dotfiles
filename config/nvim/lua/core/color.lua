-- Colorscheme, picked by `bin/theme` via ~/.local/state/theme.
-- Keys match the alacritty theme file names in config/alacritty/themes/.
local themes = {
  -- ponytail: no transparency knob upstream; unset the backgrounds by hand
  ['onehalf-dark'] = function()
    -- lazy.nvim can't auto-detect this one: colors/ sits under vim/, so the
    -- rtp append in its config runs only once the plugin is explicitly loaded
    require('lazy').load({ plugins = { 'onehalf' } })
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'onehalfdark',
      -- :highlight merges, nvim_set_hl would replace the group and drop the fg
      callback = function()
        vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
        vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
        vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')
        vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
      end,
    })
    return 'onehalfdark'
  end,
}

for _, flavour in ipairs({ 'latte', 'frappe', 'macchiato', 'mocha' }) do
  themes['catppuccin-' .. flavour] = function()
    vim.o.background = flavour == 'latte' and 'light' or 'dark'
    require('catppuccin').setup({
      flavour = flavour,
      transparent_background = true, -- let alacritty opacity show through
    })
    return 'catppuccin-' .. flavour
  end
end

-- 'tokyo-night' stays the bare night style; the rest are suffixed
for _, style in ipairs({ 'night', 'storm', 'moon', 'day' }) do
  themes[style == 'night' and 'tokyo-night' or 'tokyo-night-' .. style] = function()
    vim.o.background = style == 'day' and 'light' or 'dark'
    require('tokyonight').setup({ style = style, transparent = true })
    return 'tokyonight-' .. style
  end
end

-- 'rose-pine' stays the bare main variant; the rest are suffixed
for _, variant in ipairs({ 'main', 'moon', 'dawn' }) do
  themes[variant == 'main' and 'rose-pine' or 'rose-pine-' .. variant] = function()
    vim.o.background = variant == 'dawn' and 'light' or 'dark'
    require('rose-pine').setup({ variant = variant, styles = { transparency = true } })
    return 'rose-pine-' .. variant
  end
end

-- nightfox names its colorschemes exactly like the alacritty files it ships
for _, fox in ipairs({ 'nightfox', 'duskfox', 'nordfox', 'terafox', 'carbonfox', 'dayfox', 'dawnfox' }) do
  themes[fox] = function()
    vim.o.background = (fox == 'dayfox' or fox == 'dawnfox') and 'light' or 'dark'
    require('nightfox').setup({ options = { transparent = true } })
    return fox
  end
end

for _, theme in ipairs({ 'wave', 'dragon', 'lotus' }) do
  themes['kanagawa-' .. theme] = function()
    vim.o.background = theme == 'lotus' and 'light' or 'dark'
    require('kanagawa').setup({ theme = theme, transparent = true })
    return 'kanagawa-' .. theme
  end
end

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
