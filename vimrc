"
" (C) 2020 Kian Cross
"

if executable("node") == 1
    let g:use_coc_nvim = 1
endif

call plug#begin('~/.vim/plugged')

Plug 'HerringtonDarkholme/yats.vim'

if exists("g:use_coc_nvim") && g:use_coc_nvim == 1
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'raimondi/delimitmate'

" Keep last
Plug 'ryanoasis/vim-devicons'

call plug#end()

if exists("g:use_coc_nvim") && g:use_coc_nvim == 1
    source ~/.vim/coc.nvim.vim

    let g:coc_global_extensions = ['coc-tsserver','coc-eslint','coc-stylelint','coc-json','coc-prettier', 'coc-yaml', 'coc-pyright']
endif

" Terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <silent><c-n> :call OpenTerminal()<CR>

" Navigation mappings
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

" File Explorer
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-f> :NERDTreeToggle<CR>

" Search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Theme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" Other
syntax on
filetype plugin indent on

set encoding=UTF-8

set expandtab
set tabstop=2
set shiftwidth=2
set nu
set ruler
set ff=unix
set wildmode=longest,list
set backspace=indent,eol,start

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
