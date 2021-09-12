" ------------------------------------ Plugins ---------------------------------------

call plug#begin('~/.nvim/plugged')        " Set directory for plugins

Plug 'tpope/vim-fugitive'                 " Git
Plug 'keith/swift.vim'                    " Swift plugin
Plug 'cespare/vim-toml'                   " Toml plugin
Plug 'preservim/nerdtree'                 " File browsing
Plug 'preservim/nerdcommenter'            " Easier comment
Plug 'christoomey/vim-tmux-navigator'     " Vim + Tmux
Plug 'vim-airline/vim-airline'            " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim'
Plug 'rhysd/git-messenger.vim'            " Git
Plug 'tpope/vim-surround'                 " Surround text objects
Plug 'tpope/vim-commentary'               " Comment code

Plug 'neovim/nvim-lspconfig'              " LSP integration
Plug 'hrsh7th/nvim-compe'                 " Auto complete
Plug 'ray-x/lsp_signature.nvim'           " Method signature

Plug 'folke/trouble.nvim'                 " Diagnostics
" TODO: consider replacing this.
" To install: npm install -g diagnostic-languageserver
Plug 'iamcco/diagnostic-languageserver'   " Needed for linters
Plug 'dirtyhabits97/diagnosticls-configs-nvim', { 'branch': 'swiftlint' } " Linters

Plug 'ryanoasis/vim-devicons'             " Icons
Plug 'sonph/onehalf', { 'rtp': 'vim' }    " Colors

call plug#end()

" ---------------------------------- Plugin Config ----------------------------------

" Easier navigation
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeShowBookmarks=1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
      \ 'swift': { 'left': '// ','right': '' },
      \ 'ruby': { 'left': '# ' },
      \ 'bash': { 'left': '# ' }
\ }

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" FZF
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-t': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" ---------------------------------- Theme & Color ----------------------------------

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
