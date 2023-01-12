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
