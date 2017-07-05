" ZFVimTxtHighlight.vim - vim script to highlight plain text files
" Author:  ZSaberLv0 <http://zsaber.com/>

let g:ZFVimTxtHighlight_loaded=1

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

function! ZF_VimTxtHighlightEcho()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction
command! -nargs=0 ZFHIGHLIGHT :call ZF_VimTxtHighlightEcho()

