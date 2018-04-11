"
" (C) 2017 Kian Cross
"

execute pathogen#infect()

syntax on
filetype plugin indent on

set expandtab
set tabstop=2
set shiftwidth=2
set nu
set ruler

set spell spelllang=en_gb

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let b:syntastic_mode = "passive"
