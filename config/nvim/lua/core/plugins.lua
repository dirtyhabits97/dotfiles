------------------------------- Plugins ------------------------------

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.nvim/plugged')

-- LSP & Languages
Plug 'neovim/nvim-lspconfig'              -- LSP integration
Plug 'keith/swift.vim'                    -- Swift plugin
Plug 'solarnz/thrift.vim'                 -- Thrift highlight

Plug('nvim-treesitter/nvim-treesitter', { -- Language
  ['do'] = function()
    vim.call(':TSUpdate')
  end
})

-- Code completion
Plug 'hrsh7th/nvim-cmp'                   -- Auto complete
Plug 'hrsh7th/vim-vsnip'                  -- Snippets
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'

-- Diagnostics
Plug 'folke/trouble.nvim'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'folke/todo-comments.nvim' -- Pretty notes
-- To install:
-- npm install -g diagnostic-languageserver
Plug 'iamcco/diagnostic-languageserver'         -- Needed for linters
Plug 'creativenull/diagnosticls-configs-nvim'   -- Linters

-- Status & Buffer lines
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug "SmiteshP/nvim-navic"

-- Utils
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdcommenter'            -- Easier comment
Plug 'christoomey/vim-tmux-navigator'     -- Vim + Tmux
Plug 'tpope/vim-surround'                 -- Surround text objects
Plug 'jiangmiao/auto-pairs'               -- Match (, [ and {
Plug 'ellisonleao/glow.nvim'              -- Markdown preview
Plug 'nvim-tree/nvim-tree.lua'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

-- Colors & Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/tokyonight.nvim'
Plug 'norcalli/nvim-colorizer.lua'

-- AI
-- Plug 'github/copilot.vim'

-- Performance
Plug 'dstein64/vim-startuptime'

vim.call('plug#end')

------------------------------- Config ------------------------------

-- Better comments
vim.g['NERDCustomDelimiters'] = {
  swift = { left = '// ', right = '' },
  ruby  = { left = '# ' },
  sh    = { left = '# ' },
  bash  = { left = '# ' },
  zsh   = { left = '# ' },
  lua   = { left = '-- ' },
  vim   = { left = '" ' },
  c     = { left = '// ', right = '' },
  cpp   = { left = '// ', right = '' },
}

-- Align the comments
vim.g['NERDDefaultAlign'] = 'left'

-- Git git-messenger
vim.g['git_messenger_always_into_popup'] = true

-- Copilot config
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-N>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.g.copilot_assume_mapped = true
