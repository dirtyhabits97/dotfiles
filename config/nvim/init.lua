require('general')
require('plugins')

-- Colors have to be set before the lsp
require('theme')

require('lsp')
require('completion')
require('diagnostics')
require('linters')
require('treesitter')
require('git')

vim.cmd 'source $HOME/.config/nvim/mappings.vim'
