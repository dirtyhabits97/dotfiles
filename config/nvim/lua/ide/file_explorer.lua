vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Remove / Replace default mappings
  vim.keymap.set('n', '<C-[>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '<C-t>', api.node.open.vertical, opts('Open: Vertical split'))
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical split'))
  -- -- New mappings
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
end


local nvim_tree = require("nvim-tree")
nvim_tree.setup {
  on_attach = my_on_attach,
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
}
