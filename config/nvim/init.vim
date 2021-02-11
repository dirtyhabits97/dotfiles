" ----------------------------------- General Settings -----------------------------------

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

" Completion options
set wildmenu                    " Better :find
set completeopt=noinsert,menuone

" Ignore these folders for completion
set wildignore+=.git            " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.resolved      " Package manager lock files

" -------------------------------------- Key binds --------------------------------------

nnoremap <C-n> :NERDTreeToggle<cr>

" Easier code comment
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Use tab to navigate through the pop up menu
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Easier write and quit
command! W write
command! Q quit

" Easier tab navigation
nmap <leader>1 :bp<cr>
nmap <leader>2 :bn<cr>

" --------------------------------------- Plugins ---------------------------------------

call plug#begin('~/.nvim/plugged')        " Set directory for plugins

Plug 'neovim/nvim-lspconfig'              " LSP integration
Plug 'keith/swift.vim'                    " Swift plugin
Plug 'preservim/nerdtree'                 " File browsing
Plug 'preservim/nerdcommenter'            " Easier comment
Plug 'christoomey/vim-tmux-navigator'     " Vim + Tmux
Plug 'vim-airline/vim-airline'            " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', { 'rtp': 'vim' }    " Colors

call plug#end()

" ---------------------------------- Plugin Config ----------------------------------

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'swift': { 'left': '// ','right': '' } }

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Tabs
let g:airline#extensions#tabline#enabled = 1

" ---------------------------------- Theme & Color ----------------------------------

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Ruby files
au BufRead,BufNewFile Podfile setfiletype ruby
au BufRead,BufNewFile Dangerfile setfiletype ruby
au BufRead,BufNewFile Gemfile setfiletype ruby
au BufRead,BufNewFile *.podspec setfiletype ruby

" ---------------------------------- LSP & Completion ----------------------------------

:lua << EOF
  local lspconfig = require('lspconfig')
  local on_attach = function(_, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-[>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
  end

  lspconfig.sourcekit.setup{
    serverPath = '/Applications/Xcode-12.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp',
    filetypes = {'swift'},
    on_attach = on_attach
  }
  lspconfig.pyls.setup{}
EOF

" ----------------------------------- Error detection -----------------------------------
set efm=
set efm+=%f:%l:%c:\ %trror:%m
set efm+=%f:%l:%c:\ %tarning:%m
set efm+=%f:%l:\ %trror:%m
set efm+=%f:%l:\ %tarning:%m
