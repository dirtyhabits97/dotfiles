return {
  {
    'akinsho/bufferline.nvim',
    opts = {
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
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1
          }
        }
      }
    }
  },
  'SmiteshP/nvim-navic',
}
