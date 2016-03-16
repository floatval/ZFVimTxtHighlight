if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn cluster zftxtAlwaysContains add=zftxtKeyword
syn cluster zftxtContains add=zftxtNumber,zftxtOperator,zftxtLink

syn match zftxtOperator "[~\-_+*<>\[\]{}=|#@$%&\\/:&\^\.,!?]"

syn match zftxtString "[[:alpha:]]" contains=zftxtOperator

syn match zftxtNumber "[a-zA-Z\.:\-_]*[0-9]\+[a-zA-Z\.:\-_]*"

syn region zftxtComments matchgroup=zftxtComments start="\/\/" end="$" contains=@zftxtAlwaysContains oneline
syn region zftxtComments start="\/\*" end="\*\/" contains=@zftxtAlwaysContains

syn case ignore
syn match zftxtLink "\(http\|https\|ftp\)\(\w\|[\-&=,?\:\.\/]\)*" contains=zftxtOperator
syn case match

syn match zftxtPreProc "\<[_A-Z]\+[_\-A-Z0-9]*\>"

syn match zftxtDelims "(.\+)"
syn match zftxtDelims "\[.\+\]"
syn match zftxtDelims "{[^ \t]\+}"

syn match zftxtTag "<[_a-zA-Z]\+[_a-zA-Z0-9]*>"

syn region zftxtCite matchgroup=zftxtOperator start="\"" end="\"" contains=@zftxtContains,@zftxtAlwaysContains
syn region zftxtCite matchgroup=zftxtOperator start="[`‚„«‘„‹]" end="[`’”»’“›]" contains=@zftxtContains,@zftxtAlwaysContains
syn region zftxtCite matchgroup=zftxtOperator start="\(\s\|^\)\@<='" end="'" contains=@zftxtContains,@zftxtAlwaysContains

syn keyword zftxtKeyword todo fixme note warning

hi def link zftxtCite String
hi def link zftxtComments Comment
hi def link zftxtDelims Delimiter
hi def link zftxtKeyword Keyword
hi def link zftxtLink Special
hi def link zftxtNumber Number
hi def link zftxtOperator Operator
hi def link zftxtPreProc PreProc
hi def link zftxtString Normal
hi def link zftxtTag Keyword

let b:current_syntax = "zftxt"

