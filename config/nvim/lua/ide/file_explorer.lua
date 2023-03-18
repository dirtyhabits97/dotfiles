vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require("nvim-tree")
nvim_tree.setup {
  view = {
    mappings = {
      list = {
        -- Remove / Replace default mappings
        { key = "o", action = "" },
        { key = "<C-t>", action = "vsplit" },
        { key = "s", action = "vsplit" },
        -- New mappings
        { key = "l", action = "edit" },
        { key = "h", action = "close_node" },
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
}
