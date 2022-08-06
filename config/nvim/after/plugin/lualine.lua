require('lualine').setup {
  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 4,
        buffers_color = {
          -- Same values as the general color option can be used here.
          active = 'lualine_a_normal', -- Color for active buffer.
          inactive = 'lualine_a_replace', -- Color for inactive buffer.
        },
      }
    },
  }
}

vim.cmd('colorscheme onehalfdark')
