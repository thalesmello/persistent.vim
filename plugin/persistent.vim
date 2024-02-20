if has('persistent_undo')
    set undolevels=5000
    if !isdirectory($HOME ."/.local/share/nvim/undo_files")
        silent ! mkdir -p $HOME/.local/share/nvim/undo_files
    endif

    set undodir=$HOME/.local/share/nvim/undo_files
    set undofile
endif

let s:updatecount = 20

if &updatecount == 200
    let &updatecount = s:updatecount
endif

function! s:enable_update()
    let &updatecount = s:updatecount
endfunction

function! s:disable_update()
    let s:updatecount = &updatecount
    set updatecount=0
endfunction

autocmd User MultipleCursorsPre call <SID>disable_update()
autocmd User MultipleCursorsPost call <SID>enable_update()

