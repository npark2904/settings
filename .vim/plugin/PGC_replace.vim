
function! PGC_replace#TextReplace()
    echo "[Find and Replace]"
    echo
    let s:currentWord = expand("<cword>")

    let s:originalText = g:PGC_Question("Find Text >> ", s:currentWord, "customlist,")

    if (s:originalText == '')
        echo "empty string."
        return
    endif

    echo ' '
    let s:replaceText = g:PGC_Question("Replace Text >> ", '', "customlist,")

    execute ".,$s/".s:originalText."/".s:replaceText."/cg"
endfunction

command! -bar -nargs=? -complete=customlist, FindReplace call PGC_replace#TextReplace()
