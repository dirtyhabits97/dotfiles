" ------------------------------------ Plugins ---------------------------------------

call plug#begin('~/.nvim/plugged')        " Set directory for plugins

Plug 'neovim/nvim-lspconfig'              " LSP integration
Plug 'tpope/vim-fugitive'                 " Git
Plug 'keith/swift.vim'                    " Swift plugin
Plug 'preservim/nerdtree'                 " File browsing
Plug 'preservim/nerdcommenter'            " Easier comment
Plug 'christoomey/vim-tmux-navigator'     " Vim + Tmux
Plug 'vim-airline/vim-airline'            " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', { 'rtp': 'vim' }    " Colors
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim'
Plug 'hrsh7th/nvim-compe'                 " Auto complete
Plug 'rhysd/git-messenger.vim'            " Git
Plug 'junegunn/goyo.vim'                  " Simple vim
Plug 'tpope/vim-surround'                 " Surround text objects
Plug 'tpope/vim-commentary'               " Surround text objects

call plug#end()

" ---------------------------------- Plugin Config ----------------------------------

" Easier navigation
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeShowBookmarks=1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
      \ 'swift': { 'left': '// ','right': '' },
      \ 'ruby': { 'left': '# ' }
\ }

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ---------------------------------- Theme & Color ----------------------------------

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
