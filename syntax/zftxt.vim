if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn cluster zftxtContains add=zftxtNumber,zftxtOperator,zftxtLink

syn match zftxtOperator "[~\-+*<>\[\]{}=|#@$%&\\/:&\^,!?]"

syn match zftxtString "[[:alpha:]]" contains=zftxtOperator

syn match zftxtNumber "[a-zA-Z\.:\-_]*[0-9]\+[a-zA-Z\.:\-_]*"

syn region zftxtComments matchgroup=zftxtComments start="\/\/" end="$" contains=@zftxtContains oneline
syn region zftxtComments start="\/\*" end="\*\/" contains=@zftxtContains

syn case ignore
syn match zftxtLink "\(http://\|https://\|ftp://\)\(\w\|[\-&=,?\:\.\/]\)*" contains=zftxtOperator
syn case match

syn match zftxtPreProc "\<[_A-Z]\+[_\-A-Z0-9]\{2,}\>"

syn match zftxtDelims "([^ \t\*()\[\]{}<>]\+)"
syn match zftxtDelims "\[[^ \t\*()\[\]{}<>]\+\]"
syn match zftxtDelims "{[^ \t\*()\[\]{}<>]\+}"

syn match zftxtType "[_a-zA-Z]\+[_a-zA-Z0-9]*\(::[_a-zA-Z]\+[_a-zA-Z0-9]*\)\+"

syn match zftxtDomain "\<[_a-zA-Z]\+[_a-zA-Z0-9\-]*\(\.[_a-zA-Z]\+[_a-zA-Z0-9\-]*\)\+\>"

syn match zftxtTag "<[_a-zA-Z]\+[_a-zA-Z0-9]*>"

syn region zftxtCite matchgroup=zftxtOperator start="\"" end="\"" contains=@zftxtContains
syn region zftxtCite matchgroup=zftxtOperator start="'" end="'" contains=@zftxtContains
syn region zftxtCite matchgroup=zftxtOperator start="`" end="`" contains=@zftxtContains
syn region zftxtCite matchgroup=zftxtOperator start="[‚„«‘„‹]" end="[’”»’“›]" contains=@zftxtContains
syn region zftxtCite matchgroup=zftxtOperator start="\(\s\|^\)\@<='" end="'" contains=@zftxtContains

syn case ignore
syn keyword zftxtMark todo fixme note warning @code @endcode @cond @endcond
syn case match

syn keyword zftxtKeyword const

hi def link zftxtCite String
hi def link zftxtComments Comment
hi def link zftxtDelims Delimiter
hi def link zftxtDomain Identifier
hi def link zftxtKeyword Keyword
hi def link zftxtLink Special
hi def link zftxtMark Todo
hi def link zftxtNumber Number
hi def link zftxtOperator Operator
hi def link zftxtPreProc PreProc
hi def link zftxtString Normal
hi def link zftxtTag Keyword
hi def link zftxtType Keyword

let b:current_syntax = "zftxt"

