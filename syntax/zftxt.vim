if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn cluster zftxtContains add=zftxtDelims
syn cluster zftxtContains add=zftxtDomain
syn cluster zftxtContains add=zftxtFunc
syn cluster zftxtContains add=zftxtLink
syn cluster zftxtContains add=zftxtMark
syn cluster zftxtContains add=zftxtNumber
syn cluster zftxtContains add=zftxtOption
syn cluster zftxtContains add=zftxtPreProc
syn cluster zftxtContains add=zftxtString
syn cluster zftxtContains add=zftxtType
syn cluster zftxtContains add=zftxtVar
syn cluster zftxtContains add=zftxtVersion

syn match zftxtNormal "[[:alpha:]]" contains=@zftxtOperator

syn match zftxtOperator "[~\-+*()\[\]{}<>=|#@$%&\\/:&\^,!?]"

syn match zftxtDelims  "([^,&\*()\[\]{}<>]\+)" contains=@zftxtContains
syn match zftxtDelims "\[[^,&\*()\[\]{}<>]\+\]" contains=@zftxtContains
syn match zftxtDelims  "{[^,&\*()\[\]{}<>]\+}" contains=@zftxtContains

syn match zftxtCite "[‚„«‘„‹].\{-}[’”»’“›]" contains=@zftxtContains
syn region zftxtCite start="`\{2,3} \=" end=" \=`\{2,3}" keepend contains=@zftxtContains

syn region zftxtTag start="</\{0,1}[_a-zA-Z][_a-zA-Z0-9]*" end="/\{0,1}>" contains=@zftxtContains

syn match zftxtComments "/\{2,}.*$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*#\+[ \t]\+[^#]*$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*#\+$"
syn match zftxtComments "^[ \t]*\"\+[ \t]*[^\"]*$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*rem[ \t]\+.*$" contains=@zftxtContains
syn region zftxtComments start="\(\([ \t]\+\)\|^\)/\*\+" end="\*\+/" contains=@zftxtContains

syn match zftxtPreProc "\<[_\-A-Z0-9]*[_A-Z]\{3,}[_\-A-Z0-9]*\>"
syn match zftxtPreProc "^[ \t]*[_a-zA-Z]\+[_a-zA-Z0-9]*[ \t]*\%(=[ \t]*\(.\|$\)\)\@="
syn match zftxtPreProc "#[a-z]\{2,}\>"
syn match zftxtPreProc "@[a-zA-Z]\{2,}\>"

syn match zftxtOption "\(\([ \t]\+\)\|^\)-\+[a-zA-Z0-9]\+[a-zA-Z0-9_\-=]*\>"

syn match zftxtFunc "[_a-zA-Z]\+[_a-zA-Z0-9]*\%((\)\@="
syn match zftxtFunc "[_a-zA-Z]\+[_a-zA-Z0-9]*\%(<.\+>[ \t]*(\)\@="

syn case ignore
syn match zftxtLink "[a-z0-9]\+://\(\w\|[\-&=,?\:\.\/]\)*"
syn case match

syn match zftxtDomain "/*\<[_a-zA-Z]\+[_a-zA-Z0-9\-@:/\\]*\([\./\\][_a-zA-Z]\+[_a-zA-Z0-9\-@:/\\]*\)\+\>"

syn match zftxtType "[_a-zA-Z]\+[_a-zA-Z0-9]*\(::[_a-zA-Z]\+[_a-zA-Z0-9]*\)\+"

syn match zftxtVar "\$\+[_a-zA-Z]\+[_a-zA-Z0-9]*"
syn match zftxtVar "\$\+([_a-zA-Z]\+[_a-zA-Z0-9]*)"
syn match zftxtVar "\$\+{[_a-zA-Z]\+[_a-zA-Z0-9]*}"
syn match zftxtVar "%\+[_a-zA-Z]\+[_a-zA-Z0-9]*%*"
syn match zftxtVar "%\+([_a-zA-Z]\+[_a-zA-Z0-9]*)%*"
syn match zftxtVar "%\+{[_a-zA-Z]\+[_a-zA-Z0-9]*}%*"

syn match zftxtString "\".\{-}\""
syn match zftxtString "\([^a-zA-Z0-9_]\|^\)\@<='.\{-}'"
syn match zftxtString "`\+.\{-}`\+"

syn match zftxtNumber "\<\([xXa-fA-F\.:\-_]*[0-9]\+\)\+[xXa-fA-F\.:\-_]*\>"

syn match zftxtVersion "\<\([a-zA-Z\.:\-_]*[0-9]\+\)\+[a-zA-Z\.:\-_]*\>"

syn case ignore
syn keyword zftxtMark todo fixme note warning
syn case match

hi def link zftxtCite String
hi def link zftxtComments Comment
hi def link zftxtDelims Delimiter
hi def link zftxtDomain Identifier
hi def link zftxtFunc Identifier
hi def link zftxtLink Special
hi def link zftxtMark Todo
hi def link zftxtNormal Normal
hi def link zftxtNumber Number
hi def link zftxtOperator Operator
hi def link zftxtOption PreProc
hi def link zftxtPreProc PreProc
hi def link zftxtString String
hi def link zftxtTag Keyword
hi def link zftxtType Keyword
hi def link zftxtVar PreProc
hi def link zftxtVersion Number

let b:current_syntax = "zftxt"

