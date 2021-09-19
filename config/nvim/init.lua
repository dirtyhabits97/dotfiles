require('general')
require('plugins')

require('lsp')
require('completion')
require('diagnostics')
require('linters')

require('theme')

vim.cmd 'source $HOME/.config/nvim/mappings.vim'
