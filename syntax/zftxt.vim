if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn cluster zftxtContains add=zftxtNumber,zftxtOperator,zftxtLink

syn match zftxtOperator "[~\-+*()\[\]{}<>=|#@$%&\\/:&\^,!?]"

syn match zftxtNormal "[[:alpha:]]" contains=zftxtOperator

syn match zftxtNumber "\<\([xXa-fA-F\.:\-_]*[0-9]\+\)\+[xXa-fA-F\.:\-_]*\>"

syn match zftxtVersion "\<\([a-zA-Z\.:\-_]*[0-9]\+\)\+[a-zA-Z\.:\-_]*\>"

syn region zftxtComments matchgroup=zftxtComments start="\/\/" end="$" contains=@zftxtContains oneline
syn region zftxtComments start="\/\*" end="\*\/" contains=@zftxtContains

syn case ignore
syn match zftxtLink "\(http://\|https://\|ftp://\)\(\w\|[\-&=,?\:\.\/]\)*" contains=zftxtOperator
syn case match

syn match zftxtPreProc "\<[_\-A-Z0-9]*[_A-Z]\{3,}[_\-A-Z0-9]*\>"

syn match zftxtDelims "([^ \t\*()\[\]{}<>]\+)"
syn match zftxtDelims "\[[^ \t\*()\[\]{}<>]\+\]"
syn match zftxtDelims "{[^ \t\*()\[\]{}<>]\+}"

syn match zftxtType "[_a-zA-Z]\+[_a-zA-Z0-9]*\(::[_a-zA-Z]\+[_a-zA-Z0-9]*\)\+"

syn match zftxtDomain "\<[_a-zA-Z]\+[_a-zA-Z0-9\-@:/\\]*\([\./\\][_a-zA-Z]\+[_a-zA-Z0-9\-@:/\\]*\)\+\>"

syn match zftxtTag "<[_a-zA-Z]\+[_a-zA-Z0-9]*>"

syn match zftxtString "\".\{-}\""
syn match zftxtString "\([^a-zA-Z0-9_]\|^\)\@<='.\{-}'"
syn region zftxtString matchgroup=zftxtOperator start="`" end="`" contains=@zftxtContains
syn match zftxtString "[‚„«‘„‹].\{-}[’”»’“›]"

syn case ignore
syn keyword zftxtMark todo fixme note warning
syn case match

hi def link zftxtComments Comment
hi def link zftxtDelims Delimiter
hi def link zftxtDomain Identifier
hi def link zftxtLink Special
hi def link zftxtMark Todo
hi def link zftxtNormal Normal
hi def link zftxtNumber Number
hi def link zftxtOperator Operator
hi def link zftxtPreProc PreProc
hi def link zftxtString String
hi def link zftxtTag Keyword
hi def link zftxtType Keyword
hi def link zftxtVersion Number

let b:current_syntax = "zftxt"

