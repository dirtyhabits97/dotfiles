------------------------------- Plugins ------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme (load immediately)
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },

  -- LSP & Languages
  { 'neovim/nvim-lspconfig', event = 'BufReadPre',
    config = function() require('ide.lsp') end },
  { 'keith/swift.vim', ft = 'swift' },
  { 'solarnz/thrift.vim', ft = 'thrift' },
  { 'nvim-treesitter/nvim-treesitter', event = 'BufReadPost', build = ':TSUpdate',
    config = function() require('ide.treesitter') end },

  -- Code completion
  { 'hrsh7th/nvim-cmp', event = 'InsertEnter',
    dependencies = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
    config = function() require('ide.completion') end },

  -- Diagnostics
  { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', event = 'LspAttach',
    config = function() require('ide.diagnostics') end },
  { 'folke/todo-comments.nvim', event = 'BufReadPost',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('optional.todo_comments') end },
  -- To install: npm install -g diagnostic-languageserver
  { 'iamcco/diagnostic-languageserver', event = 'BufReadPre' },
  { 'creativenull/diagnosticls-configs-nvim', event = 'BufReadPre',
    config = function() require('ide.linters') end },

  -- Status & Buffer lines
  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy',
    dependencies = { 'akinsho/bufferline.nvim', 'nvim-web-devicons' },
    config = function() require('ide.statusbars') end },
  { 'SmiteshP/nvim-navic', event = 'LspAttach',
    config = function() require('optional.nvim_navic') end },

  -- Utils
  { 'nvim-telescope/telescope.nvim', cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('ide.telescope') end },
  { 'preservim/nerdcommenter', event = 'BufReadPost' },
  { 'christoomey/vim-tmux-navigator', event = 'VeryLazy' },
  { 'tpope/vim-surround', event = 'BufReadPost' },
  { 'jiangmiao/auto-pairs', event = 'InsertEnter' },
  { 'ellisonleao/glow.nvim', cmd = 'Glow', ft = 'markdown',
    config = function() require('optional.glow') end },
  { 'nvim-tree/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' },
    config = function() require('ide.file_explorer') end },

  -- Git
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G', 'Gdiff', 'Gblame' } },
  { 'rhysd/git-messenger.vim', cmd = 'GitMessenger' },
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'lewis6991/gitsigns.nvim', event = 'BufReadPre',
    config = function() require('ide.git') end },

  -- Colors & Icons
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  { 'norcalli/nvim-colorizer.lua', event = 'BufReadPost',
    config = function() require('optional.colorizer') end },

  -- AI
  -- { 'github/copilot.vim', event = 'InsertEnter' },

  -- Performance
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
})

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
