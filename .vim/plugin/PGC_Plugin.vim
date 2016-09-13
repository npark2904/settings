
"- PGC - Autoload store files  ------------------------------------------------------
if ! exists('g:PGC_Store_Path')
    let g:PGC_Store_Path = $HOME."/.vim_PGC_store"
endif

function! s:Autoload_sessionFiles()
	let l:Saved_sessions = split(system("ls -a ".g:PGC_Store_Path." | grep \.PGCSession_"), "\n")
	for l:name in l:Saved_sessions
		let g:{substitute(l:name, '.', '', '')} = ""
	endfor
endfunction
call s:Autoload_sessionFiles()

if exists('g:PGC_Load_savedMarks()') 
    call g:PGC_Load_savedMarks()
endif

"- PGC - Save store files  ------------------------------------------------------
function! PGC_Plugin#Save_Workspace ( ... )
    if (a:0 == 0)
        echomsg "Empty args"
        return 
    endif

    if ! isdirectory(g:PGC_Store_Path)
        call mkdir(g:PGC_Store_Path, "p", 0755)
    endif

	if (filereadable(g:PGC_Store_Path."/.PGCSession_".a:1))
		call system("rm -rf ".g:PGC_Store_Path."/.PGCSession_".a:1)
    endif

    execute "mksession ".g:PGC_Store_Path."/.PGCSession_".a:1

    execute "silent MarkSave ".a:1
endfunction


function! PGC_Plugin#Load_StoredWorkspace ( ... ) 
    if (a:0 == 0)
        echomsg "Empty args"
        return 
    endif

	if (filereadable(g:PGC_Store_Path."/.PGCSession_".a:1))
        execute "tabnew"
        execute "tabonly"
		execute "source ".g:PGC_Store_Path."/.PGCSession_".a:1
    else
        echomsg a:1." not exist."
        return
	endif

    execute "silent MarkLoad ".a:1
endfunction


"- commands -------------------------------------------------------------------

function! PGC_Plugin#VariablesComplete( ArgLead, CmdLine, CursorPos )
	return sort(map(filter(keys(g:), 'v:val =~# "\\V\\^PGCSession_' . (empty(a:ArgLead) ? '\\S' : escape(a:ArgLead, '\')) . '"'), 'v:val[11:]'))
endfunction

command! -bar -nargs=? -complete=customlist,PGC_Plugin#VariablesComplete WorkspaceSave call PGC_Plugin#Save_Workspace(<f-args>)
command! -bar -nargs=? -complete=customlist,PGC_Plugin#VariablesComplete WorkspaceLoad call PGC_Plugin#Load_StoredWorkspace(<f-args>)


