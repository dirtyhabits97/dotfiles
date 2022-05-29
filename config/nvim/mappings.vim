" -------------------------------------- Mappings --------------------------------------

" Easier reload
command! Reload :luafile ~/.config/nvim/init.lua
command! Config :edit ~/.config/nvim/mappings.vim

" Leader key
"let g:mapleader=","
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
cmap Wq wq

" Easier navigation with wrapped lines
nnoremap j gj
nnoremap k gk

" Easier navigation between buffers
nmap <leader>1 :bp<cr>
nmap <leader>2 :bn<cr>

" Easier merge solving with fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" Easier resize
nnoremap <silent><Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent><Leader>- :exe "vertical resize -5"<CR>

" Easier FZF
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fh :HelpTags<cr>

" Easier Trouble
nnoremap <C-x> :TroubleToggle<cr>
