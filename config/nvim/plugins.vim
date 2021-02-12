" ------------------------------------ Plugins ---------------------------------------

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

" Easier navigation
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeShowBookmarks=1

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
