" mark/palettes.vim: Additional palettes for mark highlighting.
"
" DEPENDENCIES:
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
" Contributors: rockybalboa4
"
" Version:     2.7.0
" Changes:
" 04-Jul-2012, Ingo Karkat
" - Add "maximum" palette contributed by rockybalboa4 and move it and the
"   "extended" palette to a separate mark/palettes.vim autoload script., " #3F8000

function! mark#palettes#Extended()
	return [
		\   { 'ctermbg':'Yellow',     'ctermfg':'Black', 'guibg':'#FFE8A1', 'guifg':'#806000' },
		\   { 'ctermbg':'DarkRed',    'ctermfg':'White', 'guibg':'#FF0000', 'guifg':'#FFFFFF' },
		\   { 'ctermbg':'Green',      'ctermfg':'Black', 'guibg':'#ACFFA1', 'guifg':'#0F8000' },
		\   { 'ctermbg':'DarkBlue',   'ctermfg':'White', 'guibg':'#A1DBFF', 'guifg':'#004E80' },
		\   { 'ctermbg':'Magenta',    'ctermfg':'White', 'guibg':'#FFA1C6', 'guifg':'#80005D' },
		\   { 'ctermbg':'Gray',       'ctermfg':'Black', 'guibg':'#A3A396', 'guifg':'#222222' },
		\   { 'ctermbg':'Blue',       'ctermfg':'White', 'guibg':'#0000FF', 'guifg':'#F0F0FF' },
		\   { 'ctermbg':'DarkGreen',  'ctermfg':'White', 'guibg':'#D0FFA1', 'guifg':'#FFFFFF' },
		\   { 'ctermbg':'Red',        'ctermfg':'Yellow','guibg':'#F3FFA1', 'guifg':'#6F8000' },
		\   { 'ctermbg':'White',      'ctermfg':'Black', 'guibg':'#E3E3D2', 'guifg':'#999999' },
		\   { 'ctermbg':'57',         'ctermfg':'White', 'guibg':'#53534C', 'guifg':'#DDDDDD' },
		\   { 'ctermbg':'Brown',      'ctermfg':'White', 'guibg':'#FFC4A1', 'guifg':'#803000' },
		\   { 'ctermbg':'Blue',       'ctermfg':'Black', 'guibg':'#A1B7FF', 'guifg':'#001E80' },
		\   { 'ctermbg':'214',        'ctermfg':'Black', 'guibg':'#D3D3C3', 'guifg':'#666666' },
		\   { 'ctermbg':'126',        'ctermfg':'White', 'guibg':'#F5A1FF', 'guifg':'#720080' },
		\   { 'ctermbg':'156',        'ctermfg':'Black', 'guibg':'#131311', 'guifg':'#AAAAAA' },
		\   { 'ctermbg':'141',        'ctermfg':'Black', 'guibg':'#A1FEFF', 'guifg':'#007F80' },
		\   { 'ctermbg':'DarkCyan',   'ctermfg':'Black', 'guibg':'#D2A1FF', 'guifg':'#420080' },
		\   { 'ctermbg':'DarkMagenta','ctermfg':'White', 'guibg':'#A29CCF', 'guifg':'#120080' },
		\]
endfunction

function! mark#palettes#Maximum()
		let l:palette = [
		\   { 'ctermbg':'Yellow',     'ctermfg':'Black', 'guibg':'#FFE8A1', 'guifg':'#806000' },
		\   { 'ctermbg':'DarkRed',    'ctermfg':'White', 'guibg':'#FF0000', 'guifg':'#FFFFFF' },
		\   { 'ctermbg':'Green',      'ctermfg':'Black', 'guibg':'#ACFFA1', 'guifg':'#0F8000' },
		\   { 'ctermbg':'DarkBlue',   'ctermfg':'White', 'guibg':'#A1DBFF', 'guifg':'#004E80' },
		\   { 'ctermbg':'Magenta',    'ctermfg':'White', 'guibg':'#FFA1C6', 'guifg':'#80005D' },
		\   { 'ctermbg':'Gray',       'ctermfg':'Black', 'guibg':'#A3A396', 'guifg':'#222222' },
		\   { 'ctermbg':'Blue',       'ctermfg':'White', 'guibg':'#0000FF', 'guifg':'#F0F0FF' },
		\   { 'ctermbg':'002',		  'ctermfg':'White', 'guibg':'#D0FFA1', 'guifg':'#FFFFFF' },
		\   { 'ctermbg':'Red',        'ctermfg':'Yellow','guibg':'#F3FFA1', 'guifg':'#6F8000' },
		\   { 'ctermbg':'White',      'ctermfg':'Black', 'guibg':'#E3E3D2', 'guifg':'#999999' },
		\   { 'ctermbg':'57',         'ctermfg':'White', 'guibg':'#53534C', 'guifg':'#DDDDDD' },
		\   { 'ctermbg':'Brown',      'ctermfg':'White', 'guibg':'#FFC4A1', 'guifg':'#803000' },
		\   { 'ctermbg':'Blue',       'ctermfg':'Black', 'guibg':'#A1B7FF', 'guifg':'#001E80' },
		\   { 'ctermbg':'214',        'ctermfg':'Black', 'guibg':'#D3D3C3', 'guifg':'#666666' },
		\   { 'ctermbg':'126',        'ctermfg':'White', 'guibg':'#F5A1FF', 'guifg':'#720080' },
		\   { 'ctermbg':'156',        'ctermfg':'Black', 'guibg':'#131311', 'guifg':'#AAAAAA' },
		\   { 'ctermbg':'141',        'ctermfg':'Black', 'guibg':'#A1FEFF', 'guifg':'#007F80' },
		\   { 'ctermbg':'DarkCyan',   'ctermfg':'Black', 'guibg':'#D2A1FF', 'guifg':'#420080' },
		\   { 'ctermbg':'DarkMagenta','ctermfg':'White', 'guibg':'#A29CCF', 'guifg':'#120080' },
		\]
		if has('gui_running') || &t_Co >= 88
		let l:palette += [
		\   { 'ctermfg':'123',		  'ctermbg':'239', 'guibg':'#A29C29', 'guifg':'#120080' },
		\   { 'ctermfg':'Yellow',     'ctermbg':'239', 'guibg':'#FFE811', 'guifg':'#806000' },
		\   { 'ctermfg':'202',		  'ctermbg':'239', 'guibg':'#FF0012', 'guifg':'#FFFFFF' },
		\   { 'ctermfg':'154',		  'ctermbg':'239', 'guibg':'#D0FF18', 'guifg':'#FFFFFF' },
		\   { 'ctermfg':'33',		  'ctermbg':'239', 'guibg':'#A1DB14', 'guifg':'#004E80' },
		\   { 'ctermfg':'206',		  'ctermbg':'239', 'guibg':'#FFA115', 'guifg':'#80005D' },
		\   { 'ctermfg':'138',		  'ctermbg':'239', 'guibg':'#A3A316', 'guifg':'#222222' },
		\   { 'ctermfg':'Blue',       'ctermbg':'239', 'guibg':'#000017', 'guifg':'#F0F0FF' },
		\   { 'ctermfg':'Green',      'ctermbg':'239', 'guibg':'#ACFF13', 'guifg':'#0F8000' },
		\   { 'ctermfg':'Red',        'ctermbg':'239', 'guibg':'#F3FF19', 'guifg':'#6F8000' },
		\   { 'ctermfg':'Gray',       'ctermbg':'239', 'guibg':'#E3E320', 'guifg':'#999999' },
		\   { 'ctermfg':'75',         'ctermbg':'239', 'guibg':'#535321', 'guifg':'#DDDDDD' },
		\   { 'ctermfg':'106',	      'ctermbg':'239', 'guibg':'#FFC422', 'guifg':'#803000' },
		\   { 'ctermfg':'White',       'ctermbg':'239', 'guibg':'#A1B723', 'guifg':'#001E80' },
		\   { 'ctermfg':'214',        'ctermbg':'239', 'guibg':'#D3D324', 'guifg':'#666666' },
		\   { 'ctermfg':'203',        'ctermbg':'239', 'guibg':'#F5A125', 'guifg':'#720080' },
		\   { 'ctermfg':'156',        'ctermbg':'239', 'guibg':'#131326', 'guifg':'#AAAAAA' },
		\   { 'ctermfg':'141',        'ctermbg':'239', 'guibg':'#A1FE27', 'guifg':'#007F80' },
		\   { 'ctermfg':'DarkCyan',   'ctermbg':'239', 'guibg':'#D2A128', 'guifg':'#420080' },
		\   {'ctermbg':'White',		'ctermfg':'DarkRed','guibg':'#FF0100', 'guifg':'#FFFFFF' },
		\   {'ctermbg':'White',		'ctermfg':'DarkBlue','guibg':'#A1D3FF', 'guifg':'#004E80' },
		\   {'ctermbg':'White',		'ctermfg':'Magenta','guibg':'#FFA4C6', 'guifg':'#80005D' },
		\   {'ctermbg':'White',		'ctermfg':'DarkGray','guibg':'#A3A596', 'guifg':'#222222' },
		\   {'ctermbg':'White',		'ctermfg':'Red',	'guibg':'#F3F8A1', 'guifg':'#6F8000' },
		\   {'ctermbg':'White',		'ctermfg':'57',		'guibg':'#53104C', 'guifg':'#DDDDDD' },
		\   {'ctermbg':'White',		'ctermfg':'Brown',	'guibg':'#FF11A1', 'guifg':'#803000' },
		\   {'ctermbg':'White',		'ctermfg':'Blue',	'guibg':'#0006FF', 'guifg':'#F0F0FF' },
		\   {'ctermbg':'White',		'ctermfg':'214',	'guibg':'#D313C3', 'guifg':'#666666' },
		\   {'ctermbg':'White',		'ctermfg':'126',	'guibg':'#F514FF', 'guifg':'#720080' },
		\   {'ctermbg':'White',		'ctermfg':'141',	'guibg':'#A116FF', 'guifg':'#007F80' },
		\   {'ctermbg':'White',		'ctermfg':'DarkMagenta','guibg':'#A218CF', 'guifg':'#120080' },
		\]
		endif
		if has('gui_running') || &t_Co >= 256 && 1 == 0 "PGC-false 
		let l:palette += [
		\   { 'ctermfg':'White',      'ctermbg':'17',    'guifg':'White',   'guibg':'#00005f' },
		\   { 'ctermfg':'White',      'ctermbg':'22',    'guifg':'White',   'guibg':'#005f00' },
		\   { 'ctermfg':'White',      'ctermbg':'23',    'guifg':'White',   'guibg':'#005f5f' },
		\   { 'ctermfg':'White',      'ctermbg':'27',    'guifg':'White',   'guibg':'#005fff' },
		\   { 'ctermfg':'White',      'ctermbg':'29',    'guifg':'White',   'guibg':'#00875f' },
		\   { 'ctermfg':'White',      'ctermbg':'34',    'guifg':'White',   'guibg':'#00af00' },
		\   { 'ctermfg':'Black',      'ctermbg':'37',    'guifg':'Black',   'guibg':'#00afaf' },
		\   { 'ctermfg':'Black',      'ctermbg':'43',    'guifg':'Black',   'guibg':'#00d7af' },
		\   { 'ctermfg':'Black',      'ctermbg':'47',    'guifg':'Black',   'guibg':'#00ff5f' },
		\   { 'ctermfg':'White',      'ctermbg':'52',    'guifg':'White',   'guibg':'#5f0000' },
		\   { 'ctermfg':'White',      'ctermbg':'53',    'guifg':'White',   'guibg':'#5f005f' },
		\   { 'ctermfg':'White',      'ctermbg':'58',    'guifg':'White',   'guibg':'#5f5f00' },
		\   { 'ctermfg':'White',      'ctermbg':'60',    'guifg':'White',   'guibg':'#5f5f87' },
		\   { 'ctermfg':'White',      'ctermbg':'64',    'guifg':'White',   'guibg':'#5f8700' },
		\   { 'ctermfg':'White',      'ctermbg':'65',    'guifg':'White',   'guibg':'#5f875f' },
		\   { 'ctermfg':'Black',      'ctermbg':'66',    'guifg':'Black',   'guibg':'#5f8787' },
		\   { 'ctermfg':'Black',      'ctermbg':'72',    'guifg':'Black',   'guibg':'#5faf87' },
		\   { 'ctermfg':'Black',      'ctermbg':'74',    'guifg':'Black',   'guibg':'#5fafd7' },
		\   { 'ctermfg':'Black',      'ctermbg':'78',    'guifg':'Black',   'guibg':'#5fd787' },
		\   { 'ctermfg':'Black',      'ctermbg':'79',    'guifg':'Black',   'guibg':'#5fd7af' },
		\   { 'ctermfg':'Black',      'ctermbg':'85',    'guifg':'Black',   'guibg':'#5fffaf' },
		\   { 'ctermfg':'White',      'ctermbg':'90',    'guifg':'White',   'guibg':'#870087' },
		\   { 'ctermfg':'White',      'ctermbg':'95',    'guifg':'White',   'guibg':'#875f5f' },
		\   { 'ctermfg':'White',      'ctermbg':'96',    'guifg':'White',   'guibg':'#875f87' },
		\   { 'ctermfg':'Black',      'ctermbg':'101',   'guifg':'Black',   'guibg':'#87875f' },
		\   { 'ctermfg':'Black',      'ctermbg':'107',   'guifg':'Black',   'guibg':'#87af5f' },
		\   { 'ctermfg':'Black',      'ctermbg':'114',   'guifg':'Black',   'guibg':'#87d787' },
		\   { 'ctermfg':'Black',      'ctermbg':'117',   'guifg':'Black',   'guibg':'#87d7ff' },
		\   { 'ctermfg':'Black',      'ctermbg':'118',   'guifg':'Black',   'guibg':'#87ff00' },
		\   { 'ctermfg':'Black',      'ctermbg':'122',   'guifg':'Black',   'guibg':'#87ffd7' },
		\   { 'ctermfg':'White',      'ctermbg':'130',   'guifg':'White',   'guibg':'#af5f00' },
		\   { 'ctermfg':'White',      'ctermbg':'131',   'guifg':'White',   'guibg':'#af5f5f' },
		\   { 'ctermfg':'Black',      'ctermbg':'133',   'guifg':'Black',   'guibg':'#af5faf' },
		\   { 'ctermfg':'Black',      'ctermbg':'138',   'guifg':'Black',   'guibg':'#af8787' },
		\   { 'ctermfg':'Black',      'ctermbg':'142',   'guifg':'Black',   'guibg':'#afaf00' },
		\   { 'ctermfg':'Black',      'ctermbg':'152',   'guifg':'Black',   'guibg':'#afd7d7' },
		\   { 'ctermfg':'White',      'ctermbg':'160',   'guifg':'White',   'guibg':'#d70000' },
		\   { 'ctermfg':'Black',      'ctermbg':'166',   'guifg':'Black',   'guibg':'#d75f00' },
		\   { 'ctermfg':'Black',      'ctermbg':'169',   'guifg':'Black',   'guibg':'#d75faf' },
		\   { 'ctermfg':'Black',      'ctermbg':'174',   'guifg':'Black',   'guibg':'#d78787' },
		\   { 'ctermfg':'Black',      'ctermbg':'175',   'guifg':'Black',   'guibg':'#d787af' },
		\   { 'ctermfg':'Black',      'ctermbg':'186',   'guifg':'Black',   'guibg':'#d7d787' },
		\   { 'ctermfg':'Black',      'ctermbg':'190',   'guifg':'Black',   'guibg':'#d7ff00' },
		\   { 'ctermfg':'White',      'ctermbg':'198',   'guifg':'White',   'guibg':'#ff0087' },
		\   { 'ctermfg':'Black',      'ctermbg':'202',   'guifg':'Black',   'guibg':'#ff5f00' },
		\   { 'ctermfg':'Black',      'ctermbg':'204',   'guifg':'Black',   'guibg':'#ff5f87' },
		\   { 'ctermfg':'Black',      'ctermbg':'209',   'guifg':'Black',   'guibg':'#ff875f' },
		\   { 'ctermfg':'Black',      'ctermbg':'212',   'guifg':'Black',   'guibg':'#ff87d7' },
		\   { 'ctermfg':'Black',      'ctermbg':'215',   'guifg':'Black',   'guibg':'#ffaf5f' },
		\   { 'ctermfg':'Black',      'ctermbg':'220',   'guifg':'Black',   'guibg':'#ffd700' },
		\   { 'ctermfg':'Black',      'ctermbg':'224',   'guifg':'Black',   'guibg':'#ffd7d7' },
		\   { 'ctermfg':'Black',      'ctermbg':'228',   'guifg':'Black',   'guibg':'#ffff87' },
		\]
		endif
		if has('gui_running')
		let l:palette += [
		\   {                                            'guifg':'Black',   'guibg':'#b3dcff' },
		\   {                                            'guifg':'Black',   'guibg':'#99cbd6' },
		\   {                                            'guifg':'Black',   'guibg':'#7afff0' },
		\   {                                            'guifg':'Black',   'guibg':'#a6ffd2' },
		\   {                                            'guifg':'Black',   'guibg':'#a2de9e' },
		\   {                                            'guifg':'Black',   'guibg':'#bcff80' },
		\   {                                            'guifg':'Black',   'guibg':'#e7ff8c' },
		\   {                                            'guifg':'Black',   'guibg':'#f2e19d' },
		\   {                                            'guifg':'Black',   'guibg':'#ffcc73' },
		\   {                                            'guifg':'Black',   'guibg':'#f7af83' },
		\   {                                            'guifg':'Black',   'guibg':'#fcb9b1' },
		\   {                                            'guifg':'Black',   'guibg':'#ff8092' },
		\   {                                            'guifg':'Black',   'guibg':'#ff73bb' },
		\   {                                            'guifg':'Black',   'guibg':'#fc97ef' },
		\   {                                            'guifg':'Black',   'guibg':'#c8a3d9' },
		\   {                                            'guifg':'Black',   'guibg':'#ac98eb' },
		\   {                                            'guifg':'Black',   'guibg':'#6a6feb' },
		\   {                                            'guifg':'Black',   'guibg':'#8caeff' },
		\   {                                            'guifg':'Black',   'guibg':'#70b9fa' },
		\]
		endif
	return l:palette
endfunction

" vim: ts=4 sts=0 sw=4 noet
