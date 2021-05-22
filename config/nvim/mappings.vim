" -------------------------------------- Mappings --------------------------------------

" Easier reload
command! Reload :source ~/.config/nvim/init.vim
command! Config :edit ~/.config/nvim/general.vim

" Leader key
nnoremap <SPACE> <Nop> 
let g:mapleader="\<Space>"

nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-m> :NERDTreeFind<cr>

" Easier code comment
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<Bar>gv

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

" Mappings for compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Easier resize
nnoremap <silent><Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent><Leader>- :exe "vertical resize -5"<CR>
