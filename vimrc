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
set ff=unix
set wildmode=longest,list

"set spell spelllang=en_gb

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let b:syntastic_mode = "passive"
let g:tex_flavor = "latex"


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
