-- source: https://github.com/nvim-lualine/lualine.nvim

local navic = require("nvim-navic")
local lualine = require('lualine')
lualine.setup {
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'buffers',
  --       mode = 4,
  --       buffers_color = {
  --         -- Same values as the general color option can be used here.
  --         active = { gui = 'bold', fg = '#2c3039', bg = '#a7d685' }, -- Color for active buffer.
  --         inactive = { fg = '#a7d685', bg = '#282c34' }, -- Color for inactive buffer.
  --       },
  --     }
  --   },
  -- }
  sections = {
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    }
  }
}

-- TODO: move this to its own file
navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "ﰮ",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = true,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
