-- source: https://github.com/folke/todo-comments.nvim

local todoComments = require('todo-comments')
todoComments.setup {
  keywords = {
    MARK = { icon = " ", color = "mark" }
  },
  colors = {
    mark = { "#61afef" }
  }
}
