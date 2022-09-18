------------------------------- Diagnostics ------------------------------

local trouble = require('trouble')
trouble.setup {
  icons = false, -- use devicons for filenames
}

-- doc: https://git.sr.ht/~whynothugo/lsp_lines.nvim
local lsp_lines = require('lsp_lines')
lsp_lines.setup()

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
