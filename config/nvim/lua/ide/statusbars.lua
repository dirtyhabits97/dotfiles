-- source: https://github.com/akinsho/bufferline.nvim
local bufferline = require("bufferline")
bufferline.setup {
  options = {
    numbers = 'buffer_id',
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = 'nvim_lsp',
    truncate_names = false,
    -- Not needed if no mouse
    hover = {
      enabled = false
    }
  }
}

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
