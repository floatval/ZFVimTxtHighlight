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

function! s:autoApply()
    if exists('g:zf_txt_auto_highlight') && g:zf_txt_auto_highlight==0
        return
    endif
    if exists('g:zf_txt_large_file')
        let largeFile = g:zf_txt_large_file
    else
        let largeFile = 5 * 1024 * 1024
    endif
    if largeFile > 0 && getfsize(expand("<afile>")) > largeFile
        if &syntax == 'zftxt'
            set syntax=
        endif
        return
    endif
    if &syntax != '' && &syntax != 'text'
        return
    endif

    let s:ZF_VimTxtHighlightToggleSaved=&syntax
    set syntax=zftxt
endfunction

augroup ZF_VimTxtHighlight_auto
    call s:autoApply()
    autocmd!
    autocmd BufNewFile,BufReadPost,BufWritePost * call s:autoApply()
augroup END

function! ZF_VimTxtHighlightEcho()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction
command! -nargs=0 ZFHIGHLIGHT :call ZF_VimTxtHighlightEcho()

