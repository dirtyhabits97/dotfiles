-- inspired from: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
return {
  {
    'preservim/nerdtree', -- File browsing
    lazy = false,
    init = function()
      -- Easier navigation
      vim.g['NERDTreeMapActivateNode'] = 'l'
      vim.g['NERDTreeShowBookmarks'] = 1
      -- workaround for: https://github.com/preservim/nerdtree/issues/1321
      vim.g['NERDTreeMinimalMenu'] = 1
      -- NOTE: Vim-plug (my previous plugin manager) used to run this code which made NERDTree run fine!
      -- issue: https://github.com/ryanoasis/vim-devicons/issues/215#issuecomment-708882992
      vim.cmd [[
        filetype plugin indent on
        if has('vim_starting')
          if has('syntax') && !exists('g:syntax_on')
            syntax enable
          end
      ]]
    end,
    dependencies = {
      'ryanoasis/vim-devicons'
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
      -- TODO: figure out how to set the keybinds here.
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-t>"] = 'select_vertical',
            ["<C-x>"] = 'select_horizontal',
          }
        }
      }
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  {
    'folke/trouble.nvim',
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      icons = false
    }
  },
  {
    'folke/todo-comments.nvim', -- Pretty notes
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = 'BufReadPost',
    opts = {
      keywords = {
        MARK = { icon = " ", color = "mark" }
      },
      colors = {
        mark = { "#61afef" }
      }
    }
  }
}
