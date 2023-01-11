-- inspired from: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre'
  },
  {
    'folke/trouble.nvim',
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      icons = false
    }
  },
  {
    'folke/todo-comments.nvim', -- Pretty notes
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = 'BufReadPost',
    opts = {
      keywords = {
        MARK = { icon = " ", color = "mark" }
      },
      colors = {
        mark = { "#61afef" }
      }
    }
  }
}
