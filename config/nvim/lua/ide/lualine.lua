-- source: https://github.com/nvim-lualine/lualine.nvim
local lualine = require('lualine')
lualine.setup {
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
}
