if !exists("go_highlight_operators")
	let go_highlight_operators = 0
endif

if !exists("go_highlight_functions")
	let go_highlight_functions = 0
endif

if !exists("go_highlight_methods")
	let go_highlight_methods = 1
endif

if !exists("go_highlight_structs")
	let go_highlight_structs = 0
endif


" Operators; 
if go_highlight_operators != 0
	syn match goOperator /:=/
	syn match goOperator />=/
	syn match goOperator /<=/
	syn match goOperator /==/
	syn match goOperator /\s>\s/
	syn match goOperator /\s<\s/
	syn match goOperator /\s+\s/
	syn match goOperator /\s-\s/
	syn match goOperator /\s\*\s/
	syn match goOperator /\s\/\s/
	syn match goOperator /\s%\s/
endif
hi def link     goOperator         Operator

" Functions; 
if go_highlight_functions != 0
	syn match goFunction 	 		/\(func\s\+\)\@<=\w\+\((\)\@=/
	syn match goFunction 	 		/\()\s\+\)\@<=\w\+\((\)\@=/
endif
hi def link     goFunction         Function

" Methods; 
if go_highlight_methods != 0
	syn match goMethod 	 /\(\.\)\@<=\w\+\((\)\@=/
endif
hi def link     goMethod         Function

" Structs; 
if go_highlight_structs != 0
	syn match goStruct 	 			/\(.\)\@<=\w\+\({\)\@=/
	syn match goStructDef 	 	/\(type\s\+\)\@<=\w\+\(\s\+struct\s\+{\)\@=/
endif
hi def link     goStruct         Function
hi def link     goStructDef         Function

hi goMethod guifg=#9822ff
