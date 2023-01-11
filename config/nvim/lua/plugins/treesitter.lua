return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
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
        "python",
        "ruby",
        -- currently, the swift parser is slowing down redraws.
        -- "swift",
        "tsx",
        "toml",
        "vim",
        "yaml",
      },
    }
  },
}
