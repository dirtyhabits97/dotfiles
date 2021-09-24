------------------------------- Language ------------------------------
local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  ensure_installed = {
    "bash",
    "c",
    "json",
    "lua",
    "python",
    "ruby",
    "swift",
    "tsx",
    "toml",
    "vim",
    "yaml",
  },
}
