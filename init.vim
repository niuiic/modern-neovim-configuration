" lua
lua require('plugins')
lua require('basic')
" require plugin/*
lua << EOF
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugin', [[v:val =~ '\.lua$']])) do
    require('plugin.'..file:gsub('%.lua$', ''))
    end
EOF
" require keybinding/*
lua << EOF
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/keybinding', [[v:val =~ '\.lua$']])) do
    require('keybinding.'..file:gsub('%.lua$', ''))
    end
EOF
" require lsp/*
lua << EOF
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/lsp', [[v:val =~ '\.lua$']])) do
    require('lsp.'..file:gsub('%.lua$', ''))
    end
EOF
" require dap/*
lua << EOF
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/dap', [[v:val =~ '\.lua$']])) do
    require('dap.'..file:gsub('%.lua$', ''))
    end
EOF
" require snippet/*
lua << EOF
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/snippet', [[v:val =~ '\.lua$']])) do
    require('snippet.'..file:gsub('%.lua$', ''))
    end
EOF

" vim workspace
function! FindProjectRoot(lookFor)
    let pathMaker='%:p'
    while(len(expand(pathMaker))>1)
        let pathMaker=pathMaker.':h'
        let fileToCheck=expand(pathMaker).'/'.a:lookFor
        if filereadable(fileToCheck)||isdirectory(fileToCheck)
            return expand(pathMaker)
        endif
    endwhile
    return 0
endfunction

au VimEnter * :call FindProjectRoot(".root")

" vim-which-key
let g:which_key_map1 =  {}
let g:which_key_map2 =  {}

" modify file encoding
nmap <silent><nowait> <leader>e :set fenc=utf8<CR>
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16
let g:which_key_map2.e = "modify file encoding"

" theme
highlight LineNr guifg=#00ffff
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE
" hi Comment guifg=#cce5ff ctermfg=NONE

" vim-zoom
map <c-w>o <c-w>m

" vimspector
" let g:vimspector_base_dir='/home/niuiic/.local/share/nvim/site/pack/packer/start/vimspector'
"
" nmap <silent><nowait><space>dn <Plug>VimspectorStepOver
" nmap <A-n> <Plug>VimspectorStepOver
" nmap <silent><nowait><space>db <Plug>VimspectorToggleBreakpoint
" nmap <A-b> <Plug>VimspectorToggleBreakpoint
" nmap <silent><nowait><space>ds <Plug>VimspectorContinue
" nmap <silent><nowait><space>dr <Plug>VimspectorRestart
" nmap <silent><nowait><space>dp <Plug>VimspectorPause
" nmap <silent><nowait><space>da <Plug>VimspectorStop
" nmap <silent><nowait><space>df <Plug>VimspectorAddFunctionBreakpoint
" nmap <silent><nowait><space>dc <Plug>VimspectorToggleConditionalBreakpoint
" nmap <silent><nowait><space>do <Plug>VimspectorStepOut
" nmap <silent><nowait><space>du <Plug>VimspectorUpFrame
" nmap <silent><nowait><space>dd <Plug>VimspectorDownFrame
" nmap <silent><nowait><space>dt <Plug>VimspectorRunToCursor
" nmap <silent><nowait><space>dq :<C-u>VimspectorReset<CR>
" nmap <A-t> <Plug>VimspectorRunToCursor
" nmap <A-o> <Plug>VimspectorStepOut
" nmap <silent><nowait><space>di <Plug>VimspectorStepInto
" nmap <A-i> <Plug>VimspectorStepInto
" nmap <silent><nowait><space>dlc <Plug>VimspectorShowOutput Console<CR>
" nmap <silent><nowait><space>dld <Plug>VimspectorShowOutput stderr<CR>
" nmap <silent><nowait><space>dlo <Plug>VimspectorShowOutput Vimspector-out<CR>
" nmap <silent><nowait><space>dle <Plug>VimspectorShowOutput Vimspector-err<CR>
" nmap <silent><nowait><space>dls <Plug>VimspectorShowOutput server<CR>
" nmap <silent><nowait><space>dlt <Plug>VimspectorShowOutput Telemetry<CR>
" nmap <silent><nowait><space>de :<C-u>VimspectorEval<space>
" nmap <silent><nowait><space>dw :<C-u>VimspectorWatch<space>
" nmap <A-w> :<C-u>VimspectorWatch<space>
"
" let g:which_key_map1.d = {
"             \ 'name' : '+debug',
"             \ 'e' : 'eval',
"             \ 'w' : 'variable watch',
"             \ 's' : 'start or continue',
"             \ 'a' : 'stop',
"             \ 'r' : 'restart',
"             \ 'p' : 'pause',
"             \ 'b' : 'set breakpoint',
"             \ 'u' : 'move up a frame in the current call stack',
"             \ 'd' : 'move down a frame in the current call stack',
"             \ 'c' : 'set condition breakpoint',
"             \ 'f' : 'add function breakpoint',
"             \ 'n' : 'next',
"             \ 'i' : 'step in',
"             \ 'o' : 'step out',
"             \ 'q' : 'quit',
"             \ 't' : 'run to cursor',
"             \ 'l' :  {
"             \ 'name' : '+switch_output',
"             \ 'c' : 'Console',
"             \ 'd' : 'stderr',
"             \ 'o' : 'Vimspector-out',
"             \ 'e' : 'Vimspector-err',
"             \ 's' : 'server',
"             \ 't' : 'Telemetry',
"             \},
"             \}

" fold
set nofoldenable
" syntax on
" autocmd VimEnter * setlocal foldmethod=manual
au BufRead set foldmethod=manual " this is covered by unknown configuration
augroup remember_folds
    autocmd!
    au BufWinLeave ?* mkview 1
    au BufWinEnter ?* silent! loadview 1
augroup END

" save content in virtual block
function! Get_visual_selection()
    " get the position of left start visual selection
    let [line_start, column_start] = getpos("'<")[1:2]
    " get the position of right end visual selection
    let [line_end, column_end] = getpos("'>")[1:2]
    " catch them all
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    " edge cases and cleanup.
    let lines[-1] = lines[-1][: column_end - 2]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function Save_visually_selected_text_to_file()
    let selected_text = Get_visual_selection()
    call writefile(split(selected_text, "\n"), "tmp")
endfunction

vnoremap <C-s> :<c-u>call Save_visually_selected_text_to_file()<cr>

" fix the delay to enter normal mode in sql file
let g:omni_sql_no_default_maps = 1

" vim-translator
nnoremap <silent><expr> <C-[> translator#window#float#has_scroll() ?
            \ translator#window#float#scroll(1) : "\<C=[>"
nnoremap <silent><expr> <C-]> translator#window#float#has_scroll() ?
            \ translator#window#float#scroll(0) : "\<C-[>"

