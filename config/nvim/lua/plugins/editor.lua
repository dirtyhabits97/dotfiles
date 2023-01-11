-- inspired from: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua
return {
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
  -- TODO: add a keymap to preview hunk easily
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
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
