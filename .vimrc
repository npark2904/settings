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


"------------------------------------------------ split window command key!
nmap 0 <ESC><C-w>w
nmap ` <ESC><C-w>
nmap <C-w>N :tab vs<CR>
nmap gr <ESC>gT<ESC>
"------------------------------------------------ cursor & page scroll key!
nmap <s-k> <ESC>5k
nmap <s-k> <ESC>5k
nmap <s-up> <ESC>5k
nmap <s-j> <ESC>5j
nmap <s-down> <ESC>5j
nmap E <ESC>5<C-e>
nmap Y <ESC>5<C-y>


"------------------------------------------------ mark setting
map <Space> <Plug>MarkSet
"nmap <C-@> :MarkClear<CR>
map ;;' <Plug>MarkSet
nmap ;;; :MarkClear<CR>

nmap <F3> \*
nmap <F4> \#
let g:mwDefaultHighlightingPalette = 'extended'


"------------------------------------------------ My annotation hot key
xmap \// :norm i//<CR>
xmap \?? :norm xx<CR>
xmap \" :norm i"<CR>
xmap \# :norm i#<CR>
xmap \<BS> :norm x<CR>


"------------------------------------------------ My Test Question function
"------------------------------------------------ 
"{{{
function! g:PGC_Question(note)
    echohl Question
        \ | let g:str = <SID>PGC_GetInput(a:note) |
    echohl None
    return g:str
endfunction "}}}

"{{{
function! <SID>PGC_GetInput(note)
    " Be sure synchronize
    call inputsave()
    " Get the input content
    let l:input = input(a:note)
    " Save the content
    call inputrestore()
    " return value 
    return l:input
endfunction " }}}

"vmap \q :call g:PGC_Question("Question test: ")<CR>

"------------------------------------------------ 


"------------------------------------------------ remember before cursor position
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "norm g`\"" |
            \ endif

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
"------------------------------------------------ vundle settings
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
"nmap \f <ESC>:FufFile **/<CR>
nmap \f <ESC>:call g:PGC_FufFile_currentPath()<CR>
nmap \h <ESC>:FufJumpList<CR>
nmap \F <ESC>:FufLine <C-R>=expand("<cword>")<CR><CR>
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

"PGC_FufFile_currentPath {{{ "Need to reset current folder path because SrcExpl is using autochdir.
function! g:PGC_FufFile_currentPath()
   exe "set noautochdir"
   exe "lcd $PWD"
   exe "FufFile **/"
endfunction "}}}


"------------------------------------------------ cscope_macros Plugin
let g:fuf_maxMenuWidth = 200
"let g:fuf_previewHeight = 3
Plugin 'cscope_macros.vim'

"------------------------------------------------ simple_bookmarks Plugin
Plugin 'simple_bookmarks.vim'
"------------------------------------------------ simple_bookmark hot key
nmap <F8> <ESC>:CopenBookmarks<CR>
nmap \k <ESC>:Bookmark <C-R>=expand("<cword>")<CR>
"let g:bookmark_window_state = 0
"function! g:Bookmarks_toggle()
"    if g:bookmark_window_state == 0 
"       g:bookmark_window_state = 1
"       :
"    else
"       g:bookmark_window_state = 0 
"    endif
"endfunction " }}}
"
"
"------------------------------------------------ syntastic Plugin
Plugin 'syntastic'
execute pathogen#infect()

"----------------------------------------------- srcexpl- Plugin
Plugin 'Source-Explorer-srcexpl.vim'
nmap <F10> :SrcExplToggle<CR>  
let g:SrcExpl_winHeight = 10
"let g:started_path = getcwd()
