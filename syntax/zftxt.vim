if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn cluster zftxtContainsExceptString add=zftxtDelims
syn cluster zftxtContainsExceptString add=zftxtFunc
syn cluster zftxtContainsExceptString add=zftxtLink
syn cluster zftxtContainsExceptString add=zftxtMark
syn cluster zftxtContainsExceptString add=zftxtNumber
syn cluster zftxtContainsExceptString add=zftxtOption
syn cluster zftxtContainsExceptString add=zftxtPreProc
syn cluster zftxtContainsExceptString add=zftxtSpecial
syn cluster zftxtContainsExceptString add=zftxtTag
syn cluster zftxtContainsExceptString add=zftxtType
syn cluster zftxtContainsExceptString add=zftxtVar
syn cluster zftxtContainsExceptString add=zftxtVersion

syn cluster zftxtContains add=zftxtDelims
syn cluster zftxtContains add=zftxtFunc
syn cluster zftxtContains add=zftxtLink
syn cluster zftxtContains add=zftxtMark
syn cluster zftxtContains add=zftxtNumber
syn cluster zftxtContains add=zftxtOption
syn cluster zftxtContains add=zftxtPreProc
syn cluster zftxtContains add=zftxtSpecial
syn cluster zftxtContains add=zftxtTag
syn cluster zftxtContains add=zftxtType
syn cluster zftxtContains add=zftxtVar
syn cluster zftxtContains add=zftxtVersion
syn cluster zftxtContains add=zftxtString

syn match zftxtNormal "[[:alpha:]]" contains=@zftxtOperator

syn match zftxtOperator "[~\-+*()\[\]{}<>=|#@$%&\\/:&\^,!?]"

syn match zftxtComments "/\{2,}.*$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*#\+[ \t]\+.*$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*#\+$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*\"\+[ \t]*[^\"]*$" contains=@zftxtContains
syn match zftxtComments "^[ \t]*rem[ \t]\+.*$" contains=@zftxtContains
syn region zftxtComments start="/\*\+" end="\*\+/" contains=@zftxtContains

syn match zftxtDelims  "([^,&\*()\[\]{}<>]\+)" contains=@zftxtContains
syn match zftxtDelims "\[[^,&\*()\[\]{}<>]\+\]" contains=@zftxtContains
syn match zftxtDelims  "{[^,&\*()\[\]{}<>]\+}" contains=@zftxtContains

syn match zftxtSpecial "\\."

syn region zftxtTag start="</\{0,1}[_a-zA-Z][_a-zA-Z0-9]*" end="/\{0,1}>" contains=@zftxtContains

syn match zftxtVar "\$\+[_a-zA-Z]\+[_a-zA-Z0-9]*"
syn match zftxtVar "\$\+([_a-zA-Z]\+[_a-zA-Z0-9]*)"
syn match zftxtVar "\$\+{[_a-zA-Z]\+[_a-zA-Z0-9]*}"
syn match zftxtVar "%\+[_a-zA-Z]\+[_a-zA-Z0-9]*%*"
syn match zftxtVar "%\+([_a-zA-Z]\+[_a-zA-Z0-9]*)%*"
syn match zftxtVar "%\+{[_a-zA-Z]\+[_a-zA-Z0-9]*}%*"

syn match zftxtString "\".\{-}\"" contains=@zftxtContainsExceptString
syn match zftxtString "\([^a-zA-Z0-9_]\|^\)\@<='.\{-}'" contains=@zftxtContainsExceptString
syn match zftxtString "`\+.\{-}`\+" contains=@zftxtContainsExceptString
syn match zftxtString "“.\{-}”" contains=@zftxtContainsExceptString
syn match zftxtString "‘.\{-}’" contains=@zftxtContainsExceptString

syn match zftxtNumber "\(#\|\(0[xX]\)\{0,1}\)[a-fA-F0-9]\{6,8}"
syn match zftxtNumber "\<\([xXa-fA-F\.:\-_]*[0-9]\+\)\+[xXa-fA-F\.:\-_]*\>"

syn match zftxtVersion "\<\([a-zA-Z\.:\-_]*[0-9]\+\)\+[a-zA-Z\.:\-_]*\>"

syn match zftxtOption "\(\([ \t]\+\)\|^\)-\+[a-zA-Z0-9]\+[a-zA-Z0-9_\-=]*\>"

syn match zftxtPreProc "\<[_\-A-Z0-9]*[_A-Z]\{2,}[_\-A-Z0-9]*\>"
syn match zftxtPreProc "^[ \t]*[_a-zA-Z]\+[_a-zA-Z0-9]*[ \t]*\%(=[ \t]*\(.\|$\)\)\@="
syn match zftxtPreProc "#[a-z]\{2,}\>"
syn match zftxtPreProc "\%([a-z]\)\@<!@[a-zA-Z0-9_\.]\{2,}"

syn match zftxtFunc "[_a-zA-Z]\+[_a-zA-Z0-9#:]*\%((\)\@="
syn match zftxtFunc "[_a-zA-Z]\+[_a-zA-Z0-9#:]*\%(<.\+>[ \t]*(\)\@="

syn match zftxtType "[_a-zA-Z]\+[_a-zA-Z0-9]*\(::[_a-zA-Z]\+[_a-zA-Z0-9]*\)\+"

syn match zftxtLink "\([a-zA-Z0-9\-]\+:\)*\/\/[a-zA-Z0-9_\-]\+\.[a-zA-Z0-9_\-]\+[a-zA-Z0-9~!@#\$%^&\*\-_=\+\\\|;:,\.\/\?]*"
syn match zftxtLink "[a-zA-Z0-9\-]\+:\/\/[a-zA-Z0-9~!@#\$%^&\*\-_=\+\\\|;:,\.\/\?]*"
syn match zftxtLink "[a-zA-Z0-9_\-]\+\(\.[a-zA-Z0-9_\-]\+\)\{2,}[a-zA-Z0-9~!@#\$%^&\*\-_=\+\\\|;:,\.\/\?]*"
syn match zftxtLink "[a-zA-Z0-9_\-\.]\+@[a-zA-Z0-9_\-\.]\+"

syn case ignore
syn keyword zftxtMark todo fixme note warning
syn case match

syn case ignore
syn keyword zftxtKeyword if else elseif elif endif fi end
syn keyword zftxtKeyword switch case default
syn keyword zftxtKeyword for endfor foreach for_each while endwhile until
syn keyword zftxtKeyword function endfunction return
syn keyword zftxtKeyword try catch finally
syn keyword zftxtKeyword static const virtual final native
syn keyword zftxtKeyword class struct public protected private friend
syn keyword zftxtKeyword this self
syn keyword zftxtKeyword void int char string long bool boolean float double
syn keyword zftxtKeyword let set var local
syn keyword zftxtKeyword export import include require
syn keyword zftxtKeyword call command
syn case match

hi def link zftxtComments Comment
hi def link zftxtDelims Delimiter
hi def link zftxtFunc Identifier
hi def link zftxtKeyword Keyword
hi def link zftxtLink Special
hi def link zftxtMark Todo
hi def link zftxtNormal Normal
hi def link zftxtNumber Number
hi def link zftxtOperator Operator
hi def link zftxtOption PreProc
hi def link zftxtPreProc PreProc
hi def link zftxtSpecial Special
hi def link zftxtString String
hi def link zftxtTag Keyword
hi def link zftxtType Keyword
hi def link zftxtVar PreProc
hi def link zftxtVersion Number

let b:current_syntax = "zftxt"

