------------------------------- Language ------------------------------
-- nvim-treesitter 1.0 uses a new API (the old nvim-treesitter.configs module was removed)
-- Add nvim-treesitter/runtime to runtimepath for query files (highlights, folds, etc.)
vim.opt.runtimepath:append('~/.nvim/plugged/nvim-treesitter/runtime')

require('nvim-treesitter').setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "json",
    "javascript",
    "lua",
    "make",
    "objc",
    "python",
    "ruby",
    "rust",
    "starlark",
    -- currently, the swift parser is slowing down redraws.
    -- "swift",
    "tsx",
    "toml",
    "vim",
    "yaml",
  },
}

-- Enable treesitter-based highlighting (built into Neovim 0.10+)
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
