local telescope = require('telescope')
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-t>"] = 'select_vertical',
        ["<C-x>"] = 'select_horizontal',
      }
    }
  }
}
