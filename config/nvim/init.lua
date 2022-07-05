require('core.general')
require('core.plugins')
require('core.mappings')
-- Colors have to be set before the lsp
require('core.theme')
require('core.lsp')

require('extension.completion')
require('extension.diagnostics')
require('extension.linters')
require('extension.treesitter')
require('extension.git')
-- TODO: delete this
vim.cmd 'source $HOME/.config/nvim/mappings.vim'
