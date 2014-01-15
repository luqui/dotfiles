source /usr/share/vim/google/google.vim

filetype off

set backspace=indent,eol,start

call pathogen#runtime_append_all_bundles()

" swap number keys and their symbols, for huffmanized coding
noremap! 1 !
noremap! ! 1
noremap! 2 @
noremap! @ 2
noremap! 3 #
noremap! # 3
noremap! 4 $
noremap! $ 4
noremap! 5 %
noremap! % 5
noremap! 6 ^
noremap! ^ 6
noremap! 7 &
noremap! & 7
noremap! 8 *
noremap! * 8
noremap! 9 (
noremap! ( 9
noremap! 0 )
noremap! ) 0

map <C-a> ^
map <C-e> $
map! <C-a> <C-o>^
map! <C-e> <C-o>$

set modeline
set modelines=5
set ruler

set shiftwidth=2
set expandtab
set tabstop=2
set smarttab

set virtualedit=block

set ignorecase
set smartcase

filetype plugin on

set hidden
set mouse=a

set viminfo='100
set shellredir=>%s
set laststatus=2

syntax on

let g:CommandTAcceptSelectionSplitMap='<C-h>'
let g:CommandTCursorLeftMap=['Left']

noremap <C-l> :syn sync fromstart<CR><C-l>

function OpenBrowser()
    let line = getline(".")
    let url = matchstr(line, "http://[^ ,;\t]*")
    exec "!gnome-open " . url
endfunction

noremap <Leader>w :call OpenBrowser()<CR>

" Jump to last position in this file	
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set dir=~/.vim/swap
