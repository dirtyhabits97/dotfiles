require('lualine').setup {
  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 4,
        buffers_color = {
          -- Same values as the general color option can be used here.
          active = 'lualine_a_insert', -- Color for active buffer.
          inactive = { fg = '#a7d685', bg = '#282c34' }, -- Color for inactive buffer.
        },
      }
    },
  }
}

vim.cmd('colorscheme onehalfdark')
