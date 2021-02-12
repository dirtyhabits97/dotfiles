" -------------------------------------- Mappings --------------------------------------

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
inoremap jj <ESC>

" Easier navigation between buffers
nmap <leader>1 :bp<cr>
nmap <leader>2 :bn<cr>
