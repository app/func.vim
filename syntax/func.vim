if exists('b:current_syntax') && b:current_syntax == 'func'
  finish
endif

syn match gtComment /;;.*/ contains=@Spell,gtTodo
hi def link gtComment Comment


syn match gtKeyword /\<\%(var\|repeat\|do\|while\|until\|if\|ifnot\|then\|else\|elseif\|elseifnot\|int\|cell\|slice\|builder\|cont\|tuple\|asm\|impure\|method_id\|operator\|infix\|infixl\|infixr\|return\)\>/  display
hi def link gtKeyword Keyword

syn match gtBoolean /\<\%(true\|false\)\>/ display
hi def link gtBoolean Boolean
"
" A integer, including a leading plus or minus
syn match gtNumber /\%(\i\|\$\)\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
" A hex, binary, or octal number
" syn match gtNumber /\<0[xX]\x\+\>/ display
" syn match gtNumber /\<0[bB][01]\+\>/ display
" syn match gtNumber /\<0[oO][0-7]\+\>/ display
hi def link gtNumber Number

" A floating-point number, including a leading plus or minus
syn match gtFloat /\%(\i\|\$\)\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/ display
hi def link gtFloat Float
"
" The first case matches symbol operators only if they have an operand before.
syn match gtExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?.]\{-1,}\|[-=]>\|--\|++\|:/ display
hi def link gtExtendedOp gtOperator

hi def link gtOperator Operator

syn match gtSpecialOp /[,\[\]\(\)]/ display
hi def link gtSpecialOp Function

syn cluster gtBasicString contains=@Spell
syn region gtStringSimple start=/'/ end=/'/

"syn cluster gtInterpString contains=@gtBasicString,gtInterp
syn region gtString start=/"/ skip=/\\\\\|\\"/ end=/"/
"\                       contains=@gtInterpString
syn region gtString start=/'/ skip=/\\\\\|\\'/ end=/'/    contains=@gtAll
hi def link gtString String

syn region gtInterp matchgroup=gtInterpDelim start=/#{/ end=/}/ contained
\                       contains=@gtAll
hi def link gtInterpDelim PreProc

syn region gtCurlies matchgroup=gtCurly start=/{/ skip=/'.*'/ end=/}/ contains=@gtAll,gtString
syn region gtBrackets matchgroup=gtBracket start=/\[/ skip=/'.*'/ end=/\]/ contains=@gtAll,gtString
syn region gtParens matchgroup=gtParen start=/(/ skip=/'.*'/ end=/)/ contains=@gtAll,gtString

" These are highlighted the same as commas since they tend to go together.
hi def link gtCurly gtBlock
hi def link gtBracket gtBlock
hi def link gtParen gtBlock
hi def link gtBlock gtSpecialOp

syn cluster gtAll contains=gtStatement,gtRepeat,gtConditional,
\                              gtException,gtKeyword,gtOperator,
\                              gtSpecialOp,gtComment,gtExtendedOp

if !exists('b:current_syntax')
  let b:current_syntax = 'func'
endif

