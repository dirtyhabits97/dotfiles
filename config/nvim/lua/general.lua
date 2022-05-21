------------------------------- General ------------------------------
 -- source:
 -- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

local set = vim.opt

set.number          = true              -- Show real line number
set.relativenumber  = true              -- Shows relative position to current line

set.ignorecase      = true              -- Search ignores case
set.smartcase       = true              -- Better search

set.tabstop         = 2                 -- Number of spaces each tab counts for
set.shiftwidth      = 2                 -- The space << and >> moves the lines
set.softtabstop     = 2                 -- Number of spaces for some tab operations
set.expandtab       = true              -- Insert spaces instead of actual tabs
set.smarttab        = true              -- Delete entire shiftwidth of tabs when they're inserted
set.autoindent      = true              -- Indent the next line matching the previous line
set.smartindent     = true              -- Smart auto-indent when creating a new line

set.showmatch       = true              -- Set show matching parenthesis
set.matchtime       = 2                 -- The amount of time matches flash

set.cursorline      = true
set.scrolloff       = 5                 -- Lines below the cursor before scrolling

set.background      = 'dark'
set.splitbelow      = true
set.splitright      = true

-- Completion options
set.completeopt     = 'menu,menuone,noselect'

-- Ignore these folder for completion
set.wildignore      = '.git,'                              -- Version control
                    .. '*.jpg,*.bmp,*.gif,*.png,*.jpeg,'   -- Media files
                    .. '*.resolved'                        -- Package manager lock files
-- source: https://stackoverflow.com/a/29787362
-- set.listchars       = 'eol:¬,tab:>·,space:.'
set.listchars       = 'eol:¬,tab:>·'
set.list            = true

-- File types
vim.cmd [[
  au BufRead,BufNewFile Podfile         setfiletype ruby
  au BufRead,BufNewFile Dangerfile      setfiletype ruby
  au BufRead,BufNewFile Gemfile         setfiletype ruby
  au BufRead,BufNewFile *.podspec       setfiletype ruby

  au BufRead,BufNewFile Jenkinsfile     setfiletype groovy

  au BufRead,BufNewFile *.tex           setfiletype tex

  au BufRead,BufNewFile gitconfig       setfiletype gitconfig

  au BufRead,BufNewFile *.Dockerfile    setfiletype dockerfile
]]
