" lua
lua require('plugins')
lua require('basic')
lua require('keybindings')
lua require('colorscheme')
lua require('plugins.lualine')
lua require('plugins.bufferline')
lua require('plugins.nvim-treesitter')
lua require('plugins.null-ls')
lua require('plugins.which-key')
lua require('plugins.todo-comments')
lua require('plugins.suda')
lua require('plugins.vim-translator')
lua require('plugins.telescope')
lua require('plugins.dashboard-nvim')
lua require('plugins.project')
lua require('plugins.vim-floaterm')
lua require('plugins.comment')
lua require('plugins/diffview')
lua require('plugins/neoscroll')
lua require('plugins/autopairs')
lua require('plugins/surround')
lua require('plugins/trouble')
lua require('plugins/nvim-colorizer')

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

" cancel hide
autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,rust,go,vim,shell let g:indentLine_conceallevel=2

" vim-fugitive
nnoremap <silent><nowait> <space>ag :<C-u>G<space>
nnoremap <silent><nowait> <space>ac :<C-u>G commit -m<space>
nnoremap <silent><nowait> <space>al :<C-u>G log<CR>
nnoremap <silent><nowait> <space>ab :<C-u>G blame<CR>
nnoremap <silent><nowait> <space>as :<C-u>G status<CR>
nnoremap <silent><nowait> <space>ar :<C-u>Gread<CR>
nnoremap <silent><nowait> <space>aw :<C-u>Gwrite<CR>
nnoremap <silent><nowait> <space>ap :<C-u>Ggrep<space>
nnoremap <silent><nowait> <space>av :<C-u>GMove<space>
nnoremap <silent><nowait> <space>ae :<C-u>GDelete<CR>

let g:which_key_map1.a = {
            \ 'name' : '+git',
            \ 'g' : 'git command',
            \ 'c' : 'git commit',
            \ 'l' : 'git log',
            \ 'b' : 'git blame',
            \ 's' : 'git status',
            \ 'r' : 'git checkout current file',
            \ 'w' : 'git add current file',
            \ 'p' : 'git grep',
            \ 'v' : 'git move',
            \ 'e' : 'git delete current file'
            \}

" vim-gitgutter
command! Gqf GitGutterQuickFix | copen20

nnoremap <silent><nowait> <space>hq :<C-u>Gqf<CR>
nnoremap <silent><nowait> <space>hs <Plug>(GitGutterStageHunk)
nnoremap <silent><nowait> <space>hu <Plug>(GitGutterUndoHunk)
nnoremap <silent><nowait> <space>hp <Plug>(GitGutterPreviewHunk)
nnoremap <silent><nowait> <space>hf :<C-u>GitGutterFold<CR>
nnoremap <silent><nowait> <space>hh :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <silent><nowait> <space>hr :<C-u>GitGutterAll<CR>

let g:which_key_map1.h = {
            \ 'name' : '+git_diff',
            \ 'q' : 'open diff in quickfix window',
            \ 's' : 'commit the diff',
            \ 'u' : 'undo the diff',
            \ 'p' : 'preview the diff',
            \ 'f' : 'fold unchanged lines',
            \ 'h' : 'toggle line highlight',
            \ 'r' : 'refresh',
            \}

" asynctasks.vim
nnoremap <silent><nowait> <space>sr :<C-u>:AsyncTask project-run<CR>
nnoremap <silent><nowait> <space>sb :<C-u>:AsyncTask project-build<CR>
nnoremap <silent><nowait> <space>st :<C-u>:AsyncTask project-test<CR>
nnoremap <silent><nowait> <space>sd :<C-u>:AsyncTask project-debug<CR>
nnoremap <silent><nowait> <space>sB :<C-u>:AsyncTask project-concrete-build<CR>
nnoremap <silent><nowait> <space>sR :<C-u>:AsyncTask project-concrete-run<CR>
nnoremap <silent><nowait> <space>sT :<C-u>:AsyncTask project-concrete-test<CR>
nnoremap <silent><nowait> <space>sD :<C-u>:AsyncTask project-concrete-debug<CR>
nnoremap <silent><nowait> <space>sc :<C-u>:AsyncTask project-clean<CR>
nnoremap <silent><nowait> <space>sf :<C-u>:AsyncTask trans-to-en<CR>
nnoremap <silent><nowait> <space>ss :<C-u>:AsyncTask sql<CR>
nnoremap <silent><nowait> <space>se :<C-u>:AsyncTaskEdit<CR>
nnoremap <silent><nowait> <space>sE :<C-u>:AsyncTaskEdit!<CR>
nnoremap <silent><nowait> <space>sg :<C-u>:AsyncTask git<CR>
let g:asyncrun_rootmarks = ['.root']
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10
let g:asynctasks_term_cols = 80
let g:asynctasks_term_focus=0
let g:asynctasks_confirm = 0

let g:which_key_map1.s = {
            \ 'name' : '+asynctasks',
            \ 'R' : 'run project (concrete)',
            \ 'B' : 'build project (concrete)',
            \ 'T' : 'test project (concrete)',
            \ 'b' : 'build project',
            \ 't' : 'test project',
            \ 'r' : 'run project',
            \ 'd' : 'debug project',
            \ 'D' : 'debug project (concrete)',
            \ 'c' : 'clean project',
            \ 'e' : 'edit config',
            \ 's' : 'run sql command',
            \ 'E' : 'edit global config',
            \ 'f' : 'translate chinese to english',
            \}

let g:asynctasks_config_name = '.task.ini'
let g:asyncrun_open = 25

function! s:lf_task_source(...)
    let rows = asynctasks#source(&columns * 48 / 100)
    let source = []
    for row in rows
        let name = row[0]
        let source += [name . '  ' . row[1] . '  : ' . row[2]]
    endfor
    return source
endfunction


function! s:lf_task_accept(line, arg)
    let pos = stridx(a:line, '<')
    if pos < 0
        return
    endif
    let name = strpart(a:line, 0, pos)
    let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
    if name != ''
        exec "AsyncTask " . name
    endif
endfunction

function! s:lf_task_digest(line, mode)
    let pos = stridx(a:line, '<')
    if pos < 0
        return [a:line, 0]
    endif
    let name = strpart(a:line, 0, pos)
    return [name, 0]
endfunction

function! s:lf_win_init(...)
    setlocal nonumber
    setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
            \ 'source': string(function('s:lf_task_source'))[10:-3],
            \ 'accept': string(function('s:lf_task_accept'))[10:-3],
            \ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
            \ 'highlights_def': {
            \     'Lf_hl_funcScope': '^\S\+',
            \     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
            \ },
            \ 'help' : 'navigate available tasks from asynctasks.vim',
            \ }

" modify file encoding
nmap <silent><nowait> <leader>e :set fenc=utf8<CR>
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16
let g:which_key_map2.e = "modify file encoding"

" coc-go
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" theme
highlight LineNr guifg=#00ffff
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment guifg=#cce5ff ctermfg=NONE

" vim-zoom
map <c-w>o <c-w>m

" coc-spell-checker
vmap <C-p> <Plug>(coc-codeaction-selected)
xmap <C-p> <Plug>(coc-codeaction-selected)
nmap <C-p> <Plug>(coc-codeaction-selected)

" vimspector
let g:vimspector_base_dir='/home/niuiic/.local/share/nvim/site/pack/packer/start/vimspector'

nmap <silent><nowait><space>dn <Plug>VimspectorStepOver
nmap <A-n> <Plug>VimspectorStepOver
nmap <silent><nowait><space>db <Plug>VimspectorToggleBreakpoint
nmap <A-b> <Plug>VimspectorToggleBreakpoint
nmap <silent><nowait><space>ds <Plug>VimspectorContinue
nmap <silent><nowait><space>dr <Plug>VimspectorRestart
nmap <silent><nowait><space>dp <Plug>VimspectorPause
nmap <silent><nowait><space>da <Plug>VimspectorStop
nmap <silent><nowait><space>df <Plug>VimspectorAddFunctionBreakpoint
nmap <silent><nowait><space>dc <Plug>VimspectorToggleConditionalBreakpoint
nmap <silent><nowait><space>do <Plug>VimspectorStepOut
nmap <silent><nowait><space>du <Plug>VimspectorUpFrame
nmap <silent><nowait><space>dd <Plug>VimspectorDownFrame
nmap <silent><nowait><space>dt <Plug>VimspectorRunToCursor
nmap <silent><nowait><space>dq :<C-u>VimspectorReset<CR>
nmap <A-t> <Plug>VimspectorRunToCursor
nmap <A-o> <Plug>VimspectorStepOut
nmap <silent><nowait><space>di <Plug>VimspectorStepInto
nmap <A-i> <Plug>VimspectorStepInto
nmap <silent><nowait><space>dlc <Plug>VimspectorShowOutput Console<CR>
nmap <silent><nowait><space>dld <Plug>VimspectorShowOutput stderr<CR>
nmap <silent><nowait><space>dlo <Plug>VimspectorShowOutput Vimspector-out<CR>
nmap <silent><nowait><space>dle <Plug>VimspectorShowOutput Vimspector-err<CR>
nmap <silent><nowait><space>dls <Plug>VimspectorShowOutput server<CR>
nmap <silent><nowait><space>dlt <Plug>VimspectorShowOutput Telemetry<CR>
nmap <silent><nowait><space>de :<C-u>VimspectorEval<space>
nmap <silent><nowait><space>dw :<C-u>VimspectorWatch<space>
nmap <A-w> :<C-u>VimspectorWatch<space>

let g:which_key_map1.d = {
            \ 'name' : '+debug',
            \ 'e' : 'eval',
            \ 'w' : 'variable watch',
            \ 's' : 'start or continue',
            \ 'a' : 'stop',
            \ 'r' : 'restart',
            \ 'p' : 'pause',
            \ 'b' : 'set breakpoint',
            \ 'u' : 'move up a frame in the current call stack',
            \ 'd' : 'move down a frame in the current call stack',
            \ 'c' : 'set condition breakpoint',
            \ 'f' : 'add function breakpoint',
            \ 'n' : 'next',
            \ 'i' : 'step in',
            \ 'o' : 'step out',
            \ 'q' : 'quit',
            \ 't' : 'run to cursor',
            \ 'l' :  {
            \ 'name' : '+switch_output',
            \ 'c' : 'Console',
            \ 'd' : 'stderr',
            \ 'o' : 'Vimspector-out',
            \ 'e' : 'Vimspector-err',
            \ 's' : 'server',
            \ 't' : 'Telemetry',
            \},
            \}

" coc.nvim
let g:coc_snippet_prev=""
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ?
            \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" scroll preview window
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-]> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-]>"
    nnoremap <silent><nowait><expr> <C-[> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-[>"
    inoremap <silent><nowait><expr> <C-]> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-[> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-]> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-]>"
    vnoremap <silent><nowait><expr> <C-[> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-[>"
endif


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent><nowait> <space>gy <Plug>(coc-type-definition)
nmap <silent><nowait> <space>gi <Plug>(coc-implementation)
nmap <silent><nowait> <space>gr <Plug>(coc-references)
nmap <silent><nowait> <space>gd <Plug>(coc-definition)

let g:which_key_map1.g = {
            \ 'name': '+coc.goto',
            \ 'y' : 'go to type definition',
            \ 'i' : 'go to implementation',
            \ 'r' : 'go to references',
            \ 'd' : 'go to definition',
            \ }

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <silent><nowait> <space>cr <Plug>(coc-rename)

" Formatting selected code.
nmap <silent><nowait> <space>cm <Plug>(coc-format-selected)
xmap <silent><nowait> <space>cm <Plug>(coc-format-selected)

let g:which_key_map1.c = {
            \ 'name' : '+coc',
            \ 'f' : 'automatically fix errors in current line',
            \ 'm' : 'format selected code',
            \ 'r' : 'rename symbol',
            \ }

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <silent><nowait> <space>cf <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" jump to the next or previous error
nmap <silent> ck <Plug>(coc-diagnostic-prev)
nmap <silent> cj <Plug>(coc-diagnostic-next)

" Mappings for CoCList
" open CocList
nnoremap <silent><nowait> <leader>ct  :<C-u>CocList<cr>
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>cz  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>
" Restart coc.nvim
nnoremap <silent><nowait> <leader>cr  :<C-u>CocRestart<CR>
" Restart tsserver
nnoremap <silent><nowait> <leader>cR  :<C-u>CocCommand tsserver.restart<CR>

let g:which_key_map2.c = {
            \ 'name' : '+coc',
            \ 't' : 'open coc list',
            \ 'a' : 'show all diagnostics',
            \ 'e' : 'manage extensions',
            \ 'c' : 'show commands',
            \ 'o' : 'find symbol of current document',
            \ 's' : 'search workspace symbols',
            \ 'j' : 'do default action for next item',
            \ 'z' : 'do default action for previous item',
            \ 'p' : 'resume latest coc list',
            \ 'r' : 'restart coc.nvim',
            \ 'R' : 'restart tsserver',
            \ }

" coc-highlights
" hi! CocWarningSign guifg=#C27A36
" hi! CocErrorLine guifg=#E5080D
hi! CocUnusedHighlight guifg=#ff33cc

" coc-css
autocmd FileType scss setl iskeyword+=@-@

" vim-ultest
nnoremap <silent><nowait> <leader>ta :<C-u>:Ultest<CR>
nmap <silent><nowait> <leader>tf <Plug>(ultest-run-file)
nnoremap <silent><nowait> <leader>tn :<C-u>:UltestNearest<CR>
nnoremap <silent><nowait> <leader>tl :<C-u>:UltestLast<CR>
nnoremap <silent><nowait> <leader>ts :<C-u>:UltestStop<CR>
nmap <silent><nowait> <leader>to <Plug>(ultest-output-jump)
nmap <silent><nowait> <leader>tj <Plug>(ultest-summary-jump)
nmap ;j <Plug>(ultest-next-fail)
nmap ;k <Plug>(ultest-prev-fail)

let g:which_key_map2.t ={
            \ 'name' : '+test',
            \ 'a' : 'run all tests',
            \ 'f' : 'run tests in the current file',
            \ 'n' : 'run the test nearest to the cursor',
            \ 'l' : 'run the last test',
            \ 's' : 'stop all tests in the current file',
            \ 'o' : 'show output of the nearest test',
            \ 'j' : 'jump to the summary window',
            \}

let g:ultest_max_threads=8
let g:ultest_use_pty = 1
let g:ultest_summary_height=10
let g:ultest_summary_open="botright split | resize".g:ultest_summary_height
let g:ultest_output_on_run=v:false
let test#go#gotest#options = "-v"

" fold
set nofoldenable
" syntax on
" autocmd VimEnter * setlocal foldmethod=manual
set foldmethod=manual
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

let g:which_key_map1.t = {
            \ 'name' : '+translate',
            \ 'p' : 'popup',
            \ 'e' : 'echo',
            \ 'r' : 'replace',
            \ 'c' : 'clipboard',
            \ }
