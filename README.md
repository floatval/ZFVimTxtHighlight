# ZFVimTxtHighlight

vim script to highlight plain text files

here is a screenshot with [xterm16](https://github.com/vim-scripts/xterm16.vim) colorscheme

![screenshot](https://raw.githubusercontent.com/ZSaberLv0/ZFVimTxtHighlight/master/screenshot.png)

# how to use

1. use [Vundle](https://github.com/VundleVim/Vundle.vim) or any other plugin manager you like to install

    ```
    Plugin 'ZSaberLv0/ZFVimTxtHighlight'
    ```

1. by default, all `text` files or any other file that have no `syntax` specified,
    would be set to `zftxt` as `syntax`

    you can disable it by setting:

    ```
    let g:zf_txt_auto_highlight=0
    ```

    or, you may want to set `syntax` manually when necessary:

    ```
    set syntax=zftxt
    ```

# functions

* `ZF_VimTxtHighlightToggle()` : toggle current file syntax
* `ZF_VimTxtHighlightEcho()` or `:ZFHIGHLIGHT` : echo the highlight info of the word under cursor

