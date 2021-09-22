------------------------------- Plugins ------------------------------

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.nvim/plugged')

Plug 'keith/swift.vim'                    -- Swift plugin
Plug 'cespare/vim-toml'                   -- Toml plugin

Plug 'preservim/nerdtree'                 -- File browsing
Plug 'preservim/nerdcommenter'            -- Easier comment
Plug 'christoomey/vim-tmux-navigator'     -- Vim + Tmux
Plug 'vim-airline/vim-airline'            -- Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'                 -- Surround text objects
Plug 'tpope/vim-commentary'               -- Comment code
Plug('junegunn/fzf', {                    -- Fuzzy find
  ['do'] = function()
    vim.call('fzf#install')
  end
})
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'                 -- Git
Plug 'rhysd/git-messenger.vim'            -- Git

Plug 'neovim/nvim-lspconfig'              -- LSP integration
Plug 'hrsh7th/nvim-compe'                 -- Auto complete
Plug 'ray-x/lsp_signature.nvim'           -- Method signature
Plug 'folke/trouble.nvim'                 -- Diagnostics
-- To install:
-- npm install -g diagnostic-languageserver
Plug 'iamcco/diagnostic-languageserver'   -- Needed for linters
Plug 'creativenull/diagnosticls-configs-nvim'   -- Linters

Plug 'ryanoasis/vim-devicons'             -- Icons
Plug('sonph/onehalf', { rtp = 'vim' })    -- Colors

vim.call('plug#end')

------------------------------- Config ------------------------------
-- Easier navigation
vim.g['NERDTreeMapActivateNode'] = 'l'
vim.g['NERDTreeShowBookmarks'] = 1

-- Better comments
vim.g['NERDCustomDelimiters'] = {
  swift = { left = '// ', right = '' },
  ruby  = { left = '# ' },
  bash  = { left = '# ' },
  lua   = { left = '-- ' },
  vim   = { left = '" ' },
}

-- Align the comments
vim.g['NERDDefaultAlign'] = 'left'

-- Tabs
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'

-- FZF
vim.g['fzf_action'] = {
  ['ctrl-x'] = 'split',
  ['ctrl-t'] = 'vsplit',
}
vim.g['fzf_layout'] = {
  window = { width = 0.9, height = 0.6 }
}
