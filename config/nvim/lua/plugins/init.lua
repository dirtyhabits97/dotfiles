return {
  -- LSP & Languages
  'neovim/nvim-lspconfig', -- LSP integration
  'ray-x/lsp_signature.nvim', -- Method signature
  {
    'keith/swift.vim', -- Swift plugin
    ft = 'swift'
  },
  {
    'solarnz/thrift.vim', -- Thrift highlight
    ft = 'thrift'
  },

  -- Code completion
  {
    'hrsh7th/nvim-cmp', -- Auto complete
    dependencies = {
      'hrsh7th/vim-vsnip', -- Snippets
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    }
  },

  -- Diagnostics
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  'folke/todo-comments.nvim', -- Pretty notes
  -- To install:
  -- npm install -g diagnostic-languageserver
  'iamcco/diagnostic-languageserver', -- Needed for linters
  'creativenull/diagnosticls-configs-nvim', -- Linters

  -- Status & Buffer lines
  'nvim-lualine/lualine.nvim',
  'SmiteshP/nvim-navic',

  -- Utils
  'nvim-telescope/telescope.nvim',
  {
    'preservim/nerdtree', -- File browsing
    lazy = false,
    init = function()
      -- Easier navigation
      vim.g['NERDTreeMapActivateNode'] = 'l'
      vim.g['NERDTreeShowBookmarks'] = 1
      -- workaround for: https://github.com/preservim/nerdtree/issues/1321
      vim.g['NERDTreeMinimalMenu'] = 1
    end,
    dependencies = {
      'ryanoasis/vim-devicons'
    }
  },
  'preservim/nerdcommenter', -- Easier comment
  'christoomey/vim-tmux-navigator', -- Vim + Tmux
  'tpope/vim-surround', -- Surround text objects
  'tpope/vim-commentary', -- Comment code
  'jiangmiao/auto-pairs', -- Match (, [ and {

  -- Git
  'tpope/vim-fugitive',
  'rhysd/git-messenger.vim',
  'nvim-lua/plenary.nvim',
  'lewis6991/gitsigns.nvim',

  -- Colors & Icons
  'kyazdani42/nvim-web-devicons',
  'norcalli/nvim-colorizer.lua',

  -- Performance
  'lewis6991/impatient.nvim',
  'dstein64/vim-startuptime',
}
