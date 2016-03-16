" ZFVimTxtHighlight.vim - vim script to highlight plain text files
" Author:  ZSaberLv0 <http://zsaber.com/>

if exists("g:zf_txt_auto_highlight") && g:zf_txt_auto_highlight != 1
    finish
endif

function! s:ZF_VimTxtHighlight()
    if &filetype != '' && &filetype != 'text'
        return
    endif
    set filetype=zftxt
endfunction

augroup ZF_VimTxtHighlight_auto
    call s:ZF_VimTxtHighlight()
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:ZF_VimTxtHighlight()
augroup END

