" ------------------------------------ General ---------------------------------------

set nocompatible                " No need to behave like vi
syntax on                       " Show color scheme
set path+=**                    " Make :find search recursively in subdirectories

set number                      " Shows line numbers
set relativenumber
set tabstop=2                   " Number of spaces each tab counts for
set shiftwidth=2                " The space << and >> moves the lines
set softtabstop=2               " Number of spaces for some tab operations
set expandtab                   " Insert spaces instead of actual tabs
set smarttab                    " Delete entire shiftwidth of tabs when they're inserted
set autoindent                  " Indent the next line matching the previous line
set smartindent                 " Smart auto-indent when creating a new line
set showmatch                   " Set show matching parenthesis
set matchtime=2                 " The amount of time matches flash
set autoread                    " Watch for file changes and auto update
set noerrorbells                " Don't make noise
set background=dark
set cursorline
set scrolloff=5                 " Lines below the cursor before scrolling
set splitbelow
set splitright

" Completion options
set wildmenu                    " Better :find
"set completeopt=noinsert,menuone
set completeopt=menuone,noselect

" Ignore these folders for completion
set wildignore+=.git            " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.resolved      " Package manager lock files

" Ruby files
au BufRead,BufNewFile Podfile     setfiletype ruby
au BufRead,BufNewFile Dangerfile  setfiletype ruby
au BufRead,BufNewFile Gemfile     setfiletype ruby
au BufRead,BufNewFile *.podspec   setfiletype ruby

" Auto format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.swift lua vim.lsp.buf.formatting_sync(nil, 100)
