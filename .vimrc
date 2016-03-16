set number
set softtabstop=4 "ontab key letter to space
set tabstop=4 "one tab letter to space
set shiftwidth=4 "<<, >> shift space
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

"ctag define code search macro!
nmap <F8> <ESC><C-W>g}

"------------------------------------------------ mark setting
map <Space> <Plug>MarkSet
"nmap <C-@> :MarkClear<CR>
nmap ;;; :MarkClear<CR>
map <F3> \*
map <F4> \#
let g:mwDefaultHighlightingPalette = 'extended'

"----------------------------------------------------------------
"------------------------------------------------ vendle settings
"----------------------------------------------------------------

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
Plugin 'L9'
 
filetype plugin indent on

"------------------------------------------------ NERDTree Plugin
Plugin 'The-NERD-tree'
nmap <F11> <ESC>:NERDTreeToggle<CR>
nmap \<F11> <ESC>:NERDTreeFind<CR>

let NERDTreeWinPos = "left"
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=40

"------------------------------------------------ mouse option toggle Plugin
Plugin 'toggle_mouse'
"map <F7> <ESC>:set mouse=a<CR>
"map <S-F7> <ESC>:set mouse-=a<CR>

"------------------------------------------------ Tagbar toggle Plugin
Plugin 'Tagbar'
nmap <F12> <ESC>:TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 40
let g:tagbar_show_linenumbers = 1
"let g:autofocus = 1

"------------------------------------------------ Powerline Bundle
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
set laststatus=2
"language en_US.UTF-8
"let g:Powerline_symbols = 'fancy'

"------------------------------------------------ AutoComplPop Plugin
Plugin 'AutoComplPop'

"------------------------------------------------ ctrlp Plugin
Plugin 'ctrlp.vim'
nmap \p <ESC>:CtrlPTag<CR>
nmap \<S-P> <ESC>:CtrlPBufTagAll<CR>
