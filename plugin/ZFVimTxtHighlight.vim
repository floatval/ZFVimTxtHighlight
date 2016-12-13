" ZFVimTxtHighlight.vim - vim script to highlight plain text files
" Author:  ZSaberLv0 <http://zsaber.com/>

if exists("g:zf_txt_auto_highlight") && g:zf_txt_auto_highlight != 1
    finish
endif

let s:ZF_VimTxtHighlightToggleSaved=''
function! ZF_VimTxtHighlightToggle()
    if &syntax=='zftxt'
        let &syntax=s:ZF_VimTxtHighlightToggleSaved
    else
        let s:ZF_VimTxtHighlightToggleSaved=&syntax
        set syntax=zftxt
    endif
    echo &syntax
endfunction

function! s:ZF_VimTxtHighlightOn()
    if &syntax != '' && &syntax != 'text'
        return
    endif
    set syntax=zftxt
endfunction

augroup ZF_VimTxtHighlight_auto
    call s:ZF_VimTxtHighlightOn()
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:ZF_VimTxtHighlightOn()
augroup END

