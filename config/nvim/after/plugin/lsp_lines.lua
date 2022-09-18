-- doc: https://git.sr.ht/~whynothugo/lsp_lines.nvim

local lsp_lines = require('lsp_lines')
lsp_lines.setup()

vim.diagnostic.config({ 
  virtual_lines = {
    only_current_line = true 
  } 
})
