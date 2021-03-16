" -------------------------------------- Mappings --------------------------------------

" Leader key
nnoremap <SPACE> <Nop> 
let g:mapleader="\<Space>"

nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-m> :NERDTreeFind<cr>

" Easier code comment
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Use tab to navigate through the pop up menu
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Easier write and quit
command! W write
command! Q quit
inoremap jj <ESC>
inoremap kk <ESC>

" Easier navigation with wrapped lines
nnoremap j gj
nnoremap k gk

" Easier navigation between buffers
nmap <leader>1 :bp<cr>
nmap <leader>2 :bn<cr>

" Easier merge solving with fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
