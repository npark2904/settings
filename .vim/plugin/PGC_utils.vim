
function! PGC_utils#PrintAbsolutePath()
    echo "[Current File Path]"
    echo
    echo resolve(expand('%:p'))
endfunction

command! -bar -nargs=? -complete=customlist, Path call PGC_utils#PrintAbsolutePath()
