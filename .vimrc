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

"add filetype
au BufNewFile,BufRead *.jsm set filetype=javascript
au BufNewFile,BufRead *.aidl set filetype=java
augroup filetypedetect
au BufNewFile,BufRead *.webidl setf widl
augroup END

"------------------------------------------------ (ctag) define code search macro!
nmap \ <ESC><Plug>MarkSet<ESC>:ts <C-R>=expand("<cword>")<CR><CR>
"nmap \} <ESC><Plug>MarkSet<ESC>:pts <C-R>=expand("<cword>")<CR><CR>
nmap \} <ESC><Plug>MarkSet<ESC>:cs find g <C-R>=expand("<cword>")<CR><CR>
nmap \] <ESC><Plug>MarkSet<ESC>:tab ts <C-R>=expand("<cword>")<CR><CR>
nmap \[ <ESC><Plug>MarkSet<ESC>:tab cs find c <C-R>=expand("<cword>")<CR><CR>
nmap \s <ESC><Plug>MarkSet<ESC>:tab cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap \} <ESC><Plug>MarkSet<C-W>g}

"------------------------------------------------ split window command macro!
nmap 0 <ESC><C-w>w
nmap ` <ESC><C-w>
nmap <C-w>N :tab vs<CR>
"------------------------------------------------ cursor move macro!
nmap <s-k> <ESC>5k
nmap <s-up> <ESC>5k
nmap <s-j> <ESC>5j
nmap <s-down> <ESC>5j

"------------------------------------------------ mark setting
map <Space> <Plug>MarkSet
"nmap <C-@> :MarkClear<CR>
map ;;' <Plug>MarkSet
nmap ;;; :MarkClear<CR>

nmap <F3> \*
nmap <F4> \#
let g:mwDefaultHighlightingPalette = 'extended'


"------------------------------------------------ Set cscope & ctag DB file

set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
if filereadable("./cscope.out")
    cs add cscope.out
else
    cs add ~/db/cscope.out
endif
set csverb

if filereadable("./tags")
    set tags=./tags
else
    set tags=~/db/tags
endif

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
"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=500
"nmap \p <ESC>:CtrlPTag<CR>
nmap \p <ESC>:CtrlPBufTag<CR>
nmap \<S-P> <ESC>:CtrlPBufTagAll<CR>
nmap \<C-P> <ESC>:CtrlPBookmarkDir<CR>

"------------------------------------------------ Fuzzyfinder Plugin
Plugin 'FuzzyFinder'
nmap \f <ESC>:FufFile **/<CR>
nmap \h <ESC>:FufJumpList **/<CR>
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

"------------------------------------------------ cscope_macros Plugin
Plugin 'cscope_macros.vim'

