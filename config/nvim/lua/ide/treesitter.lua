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
    "cpp",
    "json",
    "javascript",
    "lua",
    "make",
    "python",
    "ruby",
    "starlark",
    -- currently, the swift parser is slowing down redraws.
    -- "swift",
    "tsx",
    "toml",
    "vim",
    "yaml",
  },
}
