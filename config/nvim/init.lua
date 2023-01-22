-- PERF:
-- Delete once https://github.com/neovim/neovim/pull/15436 is merged.
-- Conflicts with nvim-treesitter https://github.com/nvim-treesitter/nvim-treesitter/issues/2882
local ok, impatient = pcall(require, "impatient")

if ok then
  impatient.enable_profile()
end

require('core')
require('ide')
require('pretty')
