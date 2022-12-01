
" set paste toggle
set pastetoggle=<leader>v

" crude buffer text object
xnoremap i% GoggV
onoremap i% :normal vi%<CR>

" remove extra whitespace
" nmap <leader>c :%s/\s\+$<cr>
" nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" set autocomlete movement to ctrl+h/j/k/l
" down
let g:BASH_Ctrl_j = 'off'
inoremap <expr> <C-j> pumvisible() ? "<C-n>" :"<C-j>"
" up
inoremap <expr> <C-k> pumvisible() ? "<C-p>" :"<C-k>"
" select
inoremap <expr> <C-l> pumvisible() ? "<C-y>" :"<C-l>"
" inoremap <expr> <Tab> pumvisible() ? "<C-y>" :"<Tab>"
" cancel - it won't work with ctrl-h
" inoremap <expr> <C-h> pumvisible() ? "<C-e>" :"<C-h>"

" Improving jumping
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" saved macros
" this one is used for variables in values.yaml
let @s = 'fn~bivariablejkjciwawsSecretNamejkwwdf9df:$bbDj0'
