set number
set softtabstop=2 "ontab key letter to space
set tabstop=2 "one tab letter to space
set shiftwidth=2 "<<, >> shift space
set expandtab

set sm
set title

set nobackup
syntax on
set ruler "viewing curer position
"set autoindent

set hls "highlight for search wordg
set incsearch

set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
"color molokai
"set background=dark

"add jsm filetype
au BufNewFile,BufRead *.jsm set filetype=javascript

"add webidl filetype
augroup filetypedetect
au BufNewFile,BufRead *.webidl setf widl
augroup END

map <Space> <Plug>MarkSet
map ;;; :MarkClear<CR>
map <F3> \*
map <F4> \#
let g:mwDefaultHighlightingPalette = 'extended' 
