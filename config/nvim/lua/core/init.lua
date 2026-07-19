-- vim.lsp.set_log_level("debug")

-- shim deprecated vim.tbl_flatten (bufferline/lualine/lspconfig still call it)
-- with a non-deprecated impl so no startup warning; drop when those plugins update.
vim.tbl_flatten = function(t) return vim.iter(t):flatten(math.huge):totable() end

require('core.plugins')
require('core.set')
require('core.mappings')
require('core.color')
