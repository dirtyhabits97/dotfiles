-- source: https://github.com/folke/todo-comments.nvim

local ok, todo_comments = pcall(require, "todo-comments")

if ok then
  todo_comments.setup {
    keywords = {
      MARK = { icon = " ", color = "#a9b1d6" }
    },
  }
end
