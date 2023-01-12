return {
  'tpope/vim-fugitive',
  {
    'rhysd/git-messenger.vim',
    cmd = 'GitMessenger',
    keys = {
      { '<leader>gm', '<cmd>GitMessenger<cr>', desc = 'GitMessenger' }
    },
    init = function()
      vim.g['git_messenger_always_into_popup'] = true
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    keys = {
      { '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'GitMessenger' }
    },
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
    }
  },
}
