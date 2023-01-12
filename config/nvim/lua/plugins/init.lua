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
  -- To install:
  -- npm install -g diagnostic-languageserver
  'iamcco/diagnostic-languageserver', -- Needed for linters
  'creativenull/diagnosticls-configs-nvim', -- Linters

  -- Utils
  {
    'preservim/nerdcommenter', -- Easier comment
    init = function()
      -- Better comments
      vim.g['NERDCustomDelimiters'] = {
        swift = { left = '// ', right = '' },
        ruby  = { left = '# ' },
        bash  = { left = '# ' },
        lua   = { left = '-- ' },
        vim   = { left = '" ' },
        c     = { left = '// ', right = '' },
        cpp   = { left = '// ', right = '' },
      }

      -- Align the comments
      vim.g['NERDDefaultAlign'] = 'left'
    end
  },
  'christoomey/vim-tmux-navigator', -- Vim + Tmux
  'tpope/vim-surround', -- Surround text objects
  'tpope/vim-commentary', -- Comment code
  'jiangmiao/auto-pairs', -- Match (, [ and {


  -- Colors & Icons
  'kyazdani42/nvim-web-devicons',
}
