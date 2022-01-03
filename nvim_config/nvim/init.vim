" cSpell:disable
call plug#begin('/home/niuiic/.local/share/nvim/pack/plugin/opt')
function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release --locked
        else
            !cargo build --release --locked --no-default-features --features json-rpc
        endif
    endif
endfunction
Plug 'will133/vim-dirdiff'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'simnalamburt/vim-mundo'
Plug 'lambdalisue/suda.vim'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'puremourning/vimspector'
Plug 'hardcoreplayers/spaceline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-codelf'
Plug 'RRethy/vim-illuminate'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-repeat'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'
Plug 'terryma/vim-smooth-scroll'
Plug 'liuchengxu/vista.vim'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'honza/vim-snippets'
Plug 'lilydjwg/fcitx.vim'
Plug 'xolox/vim-misc'
Plug 'cespare/vim-toml', {
            \ 'for' : ['toml'] }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'preservim/nerdcommenter'
Plug 'rbtnn/vim-vimscript_indentexpr'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'liuchengxu/space-vim-dark'
Plug 'dhruvasagar/vim-zoom'
Plug 'sbdchd/neoformat'
Plug 'luochen1990/rainbow'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'arzg/vim-swift'
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'bagrat/vim-buffet'
call plug#end()

set nocompatible

" basic settings
au BufNewFile,BufRead *.sv set filetype=systemverilog
au BufNewFile,BufRead *.h set filetype=c
au BufNewFile,BufRead *.hpp set filetype=cpp
au BufNewFile,BufRead *.cpp set filetype=cpp
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
let g:python3_host_prog="/usr/bin/python"
set termguicolors

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

" to fix the bug of ccls
" au FileType c inoremap <Right> ->
" add more
" au FileType go inoremap <Left> <-
" au FileType go inoremap <Right> ->
" au FileType rust inoremap <Right> =>

" set relativenumber
set encoding=UTF-8
set number
set ts=4
set sw=4
set guifont=agaveNerdFont:h13

" vim-which-key
let g:which_key_map1 =  {}
let g:which_key_map2 =  {}
let g:mapleader = "\\"
let g:maplocalleader = "\<Space>"
call which_key#register('<Space>', "g:which_key_map1")
call which_key#register('\', "g:which_key_map2")
nnoremap <silent> <localleader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '\'<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ignore

let g:which_key_map2['\'] = 'which_key_ignore'
let g:which_key_map2['\A'] = 'which_key_ignore'

" theme
colorscheme space-vim-dark
set termguicolors
highlight LineNr guifg=#00ffff
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment guifg=#00ffff ctermfg=NONE
let g:space_vim_dark_background = 236

" set save
nmap <C-s> :w!<CR>
nmap <A-s> :wa!<CR>

" format
autocmd FileType * nnoremap <AC-l> :Format<CR>
" autocmd FileType *\(.sh|.vim|.sv\)\@<! nnoremap <AC-l> :Format<CR>
autocmd FileType vim,xdc nnoremap <AC-l> gg=G

" neoformat
let g:neoformat_shell_shfmt = {
            \ 'exe': 'Shfmt',
            \ 'args': ['-l', '-w'],
            \ 'replace': 1,
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_shell = ['shfmt']

let g:neoformat_kotlin_ktlint = {
            \ 'exe': '/home/niuiic/Applications/Kotlin/ktlint',
            \ 'args': ['-F'],
            \ 'replace': 1,
            \ }
let g:neoformat_enabled_kotlin = ['ktlint']

let g:neoformat_swift_swiftformat = {
            \ 'exe': '/home/niuiic/Applications/Swift/swift-format/.build/release/swift-format',
            \ 'replace': 1,
            \ }

let g:neoformat_enabled_swift = ['swiftformat']

let g:neoformat_asm_asmfmt = {
            \ 'exe': 'asmfmt',
            \ 'args': ['-w'],
            \ 'replace': 1,
            \ }

let g:neoformat_enabled_asm = ['asmfmt']

autocmd FileType sh nnoremap <AC-l> :Neoformat shfmt<CR>
autocmd FileType kotlin nnoremap <AC-l> :Neoformat ktlint<CR>
autocmd FileType swift nnoremap <AC-l> :Neoformat swiftformat<CR>
autocmd FileType asm nnoremap <AC-l> :Neoformat asmfmt<CR>

" coc-translator
" popup
nmap <silent><nowait> <space>tp  <Plug>(coc-translator-p)
vmap <silent><nowait> <space>tp  <Plug>(coc-translator-pv)
" echo
nmap <silent><nowait> <space>te  <Plug>(coc-translator-e)
vmap <silent><nowait> <space>te  <Plug>(coc-translator-ev)
" replace
nmap <silent><nowait> <space>tr  <Plug>(coc-translator-r)
vmap <silent><nowait> <space>tr  <Plug>(coc-translator-rv)

let g:which_key_map1.t = {
            \ 'name' : '+translate',
            \ 'p' : 'popup',
            \ 'e' : 'echo',
            \ 'r' : 'replace',
            \ }

" fcitx.vim
inoremap <C-c> <esc>

" coc-pairs
autocmd FileType tex,markdown let b:coc_pairs = [["$", "$"]]
autocmd FileType rust let b:coc_pairs_disabled = ["'"]
autocmd FileType c let b:coc_pairs_disabled = ["<", ">"]
autocmd FileType systemverilog let b:coc_pairs_disabled = ["<", ">", "''"]

" vim-clap & leaderf
let g:clap_theme = 'material_design_dark'
nnoremap <silent><nowait> <space>op  :<C-u>Clap<CR>
nnoremap <silent><nowait> <space>ob  :<C-u>Leaderf buffer<CR>
nnoremap <silent><nowait> <space>oc  :<C-u>Clap command<CR>
nnoremap <silent><nowait> <space>oh  :<C-u>Clap history<CR>
nnoremap <silent><nowait> <space>of  :<C-u>Clap files ++finder=rg --ignore --hidden --files<CR>
nnoremap <silent><nowait> <space>oq  :<C-u>Leaderf quickfix<CR>
nnoremap <silent><nowait> <space>oj  :<C-u>Clap jumps<CR>
nnoremap <silent><nowait> <space>om  :<C-u>Clap marks<CR>
nnoremap <silent><nowait> <space>ow  :<C-u>Clap windows<CR>
nnoremap <silent><nowait> <space>ot  :<C-u>Clap tags<CR>
nnoremap <silent><nowait> <space>oT  :<C-u>Clap proj_tags<CR>
nnoremap <silent><nowait> <space>os  :<C-u>Clap colors<CR>
nnoremap <silent><nowait> <space>og :<C-u>Leaderf rg<CR>
nnoremap <silent><nowait> <space>ol :<C-u>Clap lines<CR>
nnoremap <silent><nowait> <space>oy :<C-u>Clap yanks<CR>
nnoremap <silent><nowait> <space>ok :<C-u>Leaderf --nowrap task<CR>

let g:which_key_map1.o = {
            \ 'name' : '+clap',
            \ 'p' : 'clap',
            \ 'b' : 'buffers',
            \ 'c' : 'command',
            \ 'h' : 'file history',
            \ 'f' : 'search file',
            \ 'q' : 'quickfix list',
            \ 'j' : 'jumps',
            \ 'm' : 'marks',
            \ 'w' : 'windows',
            \ 'T' : 'tags in project',
            \ 't' : 'tags in current file',
            \ 's' : 'colors',
            \ 'g' : 'find word',
            \ 'l' : 'line',
            \ 'y' : 'yanks',
            \ 'k' : 'tasks',
            \ }

" exit
nnoremap <C-x> :bd<CR>
nnoremap <C-q> :q<CR>
nnoremap <A-q> :q!<CR>
nnoremap <C-n> :only<CR>
nnoremap <C-e> :e<CR>

" vim-easymotion
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" Move to line
map <silent><nowait> <space>l  <Plug>(easymotion-bd-jk)
nmap <silent><nowait> <space>l  <Plug>(easymotion-bd-jk)

" Move to word
map  F  <Plug>(easymotion-bd-w)
nmap F  <Plug>(easymotion-overwin-w)

" To replace /
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:which_key_map1.l = 'move to line'
let g:which_key_map1.w = 'move to word'

" vim-floaterm
nnoremap <silent> <C-z> :FloatermToggle <CR>
tnoremap <silent> <C-z> <C-\><C-n> :FloatermToggle <CR>

let g:floaterm_width =0.7

let g:floaterm_height=0.7

" cancel hide
autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,rust,go,vim,shell let g:indentLine_conceallevel=2

" verilog_systemverilog
set foldmethod=syntax
nnoremap <Leader>ii :VerilogFollowInstance<CR>
nnoremap <Leader>ip :VerilogFollowPort<CR>

let g:which_key_map2.i = {
            \ 'name' : '+verilog',
            \ 'i' : 'follow a module instance to its module declaration',
            \ 'p' : 'navigate to the module declaration and immediately searching for that port',
            \ }

" vista.vim
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.

" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
            \ 'cpp' : 'coc',
            \ 'rust' : 'coc'
            \ }
let g:vista_ctags_cmd = {
            \ 'haskell': 'hasktags -x -o - -c',
            \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }
nnoremap <silent><nowait> <space>m :<C-u>Vista!!<cr>
let g:which_key_map1.m = 'show file tags'

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*4, 0, 8)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*4, 0, 8)<CR>

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
set updatetime=300

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
            \ }

" nerdcommenter

let g:NERDSpaceDelims=1
map <C-a> <Leader>c<space>
" let g:NERDCustomDelimiters = { 'c': { 'left': '/*', 'right': '*/' } }
let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }

" coc-explorer

nnoremap <leader>p :CocCommand explorer --quit-on-open<CR>
let which_key_map2.p ='file tree'

" vim-illuminate
let g:Illuminate_delay = 100
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
augroup END
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord CursorLine
augroup END

" vim-codelf
nnoremap <silent><nowait> <space>fs :<C-u>:Codelf<space>
nnoremap <silent><nowait> <space>fS :<C-u>CodelfOpenBrowser <space>
let g:codelf_enable_popup_menu = 'false'
let g:codelf_proxy_url="http://127.0.0.1:10025"

let g:which_key_map1.f = {
            \ 'name' : '+codelf',
            \ 's' : 'search variable names',
            \ 'S' : 'search variable names on the brower',
            \ }

" vim-spaceline
let g:spaceline_seperate_style= 'arrow-fade'
let g:spaceline_colorscheme = 'space'
let g:spaceline_custom_vim_status= {"n": "N","V":"V","v":"v","\<C-v>": "~V","i":"I","R":"R","s":"S","t":"T","c":"C","!":"SE"}

" vim-buffet
noremap <C-k> :bn<CR>
noremap <C-j> :bp<CR>
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:buffet_show_index = 1
let g:buffet_modified_icon = '*'
let g:buffet_new_buffer_name = '+'
let g:buffet_hidden_buffers = ['terminal', 'quickfix']
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00ffff
    hi! BuffetModBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#ff33cc
    hi! BuffetTab cterm=NONE ctermbg=5 ctermfg=8 guibg=#04597E
    hi! BuffetBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#04597E
endfunction

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*4, 0, 8)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*4, 0, 8)<CR>

" dashboard-nvim
let g:dashboard_custom_header = [
            \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            \]
let g:indentLine_fileTypeExclude = ['dashboard']
nnoremap <silent><nowait> <space>sl :<C-u>SessionLoad<CR>
nnoremap <silent><nowait> <space>ss :<C-u>SessionSave<CR>
nnoremap <silent><nowait> <space>kf :<C-u>DashboardNewFile<CR>
let g:which_key_map1.sl = 'load session'
let g:which_key_map1.ss = 'save session'
let g:which_key_map1.kf = 'create new file'
let g:dashboard_default_executive ='clap'
let g:dashboard_custom_shortcut={
            \ 'last_session'       : 'SPC s l',
            \ 'find_history'       : 'SPC o h',
            \ 'find_file'          : 'SPC o f',
            \ 'new_file'           : 'SPC k f',
            \ 'change_colorscheme' : 'SPC o s',
            \ 'find_word'          : 'SPC o g',
            \ 'book_marks'         : 'SPC o m',
            \ }

" filetypes
au BufRead,BufNewFile *.v set filetype=verilog
au BufRead,BufNewFile *.asm set filetype=asm
au BufRead,BufNewFile *.s set filetype=asm

" vimspector
set packpath=/home/niuiic/.local/share/nvim
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

" coc-yank
nnoremap <silent> <space>p  :<C-u>CocList -A --normal yank<cr>

let g:which_key_map1.p= 'clipboard history'

" markdown-composer
let g:markdown_composer_external_renderer='pandoc -f markdown -t html'
let g:markdown_composer_autostart = 0

nmap <silent><nowait><leader>ms :<C-u>ComposerStart<CR>
nmap <silent><nowait><leader>mu :<C-u>ComposerUpdate<CR>
nmap <silent><nowait><leader>mo :<C-u>ComposerOpen<CR>
nmap <silent><nowait><leader>mj :<C-u>ComposerJob<CR>

let g:which_key_map2.m = {
            \ 'name' : '+markdown_preview',
            \ 's' : 'start',
            \ 'u' : 'update',
            \ 'o' : 'open another tab',
            \ 'j' : 'echoes the channel that the plugin is listening on'
            \}

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd FileType markdown nnoremap <buffer> <AC-l> :Prettier<CR>

" suda.vim
let g:suda_smart_edit = 1

" vim-mundo
set undofile
set undodir=/home/niuiic/.vim_undo
nnoremap <silent><nowait> <space>uo  :<C-u>MundoToggle<CR>
nnoremap <silent><nowait> <space>uc :<C-u>!command rm -rf /home/niuiic/.vim_undo/*<CR>

let g:which_key_map1.u = {
            \ 'name' : '+undotree',
            \ 'o' : 'open undotree',
            \ 'c' : 'clean history',
            \}

let g:mundo_mappings = {
            \ '<CR>': 'preview',
            \ 'o': 'preview',
            \ 'j': 'move_older',
            \ 'k': 'move_newer',
            \ '<down>': 'move_older',
            \ '<up>': 'move_newer',
            \ 'J': 'move_older_write',
            \ 'K': 'move_newer_write',
            \ 'gg': 'move_top',
            \ 'G': 'move_bottom',
            \ 'P': 'play_to',
            \ 'd': 'diff',
            \ 'i': 'toggle_inline',
            \ '/': 'search',
            \ 'n': 'next_match',
            \ 'N': 'previous_match',
            \ 'p': 'diff_current_buffer',
            \ 'r': 'diff',
            \ '?': 'toggle_help',
            \ 'q': 'quit',
            \ '<2-LeftMouse>': 'mouse_click' }

" vim-dirdiff
nmap <silent><nowait> <leader>f :DirDif<space>
let g:which_key_map2.f = 'vim diff'

" coc-todolist
nmap <silent><nowait> <leader>tc :CocCommand todolist.create<CR>
nmap <silent><nowait> <leader>tu :CocCommand todolist.update<CR>
nmap <silent><nowait> <leader>td :CocCommand todolist.download<CR>
nmap <silent><nowait> <leader>te :CocCommand todolist.export<CR>
nmap <silent><nowait> <leader>tn :CocCommand todolist.closeNotice<CR>
nmap <silent><nowait> <leader>ta :CocCommand todolist.clear<CR>
nmap <silent><nowait> <leader>tb :CocCommand todolist.browserOpenGist<CR>
nmap <silent><nowait> <leader>tl :CocList todolist<CR>

let g:which_key_map2.t ={
            \ 'name' : '+todolist',
            \ 'c' : 'create',
            \ 'u' : 'update',
            \ 'd' : 'download',
            \ 'e' : 'export',
            \ 'n' : 'close notice',
            \ 'a' : 'clear',
            \ 'b' : 'open in browser',
            \ 'l' : 'open in coc list'
            \}

" syn off and enable
nmap <silent><nowait> <leader>so :syn enable<CR>
nmap <silent><nowait> <leader>sf :syn off<CR>
" to fix the bug of coc.nvim when go to definition
au VimEnter * :syn off<CR>
au VimEnter * :syn enable<CR>

" quickfix
au VimEnter * :set makeprg=make
nnoremap <silent><nowait> <space>qs :<C-u>set makeprg=
nnoremap <silent><nowait> <space>qo :<C-u>cope25<CR>
nnoremap <silent><nowait> <space>qm :<C-u>make<CR>
nnoremap <silent><nowait> <space>qc :<C-u>cclose<CR>
nnoremap <silent><nowait> <space>qw :<C-u>write! build.log<CR>
nnoremap <silent><nowait> <space>qe :<C-u>set modifiable<CR>

nmap <A-j> :cnext<CR>
nmap <A-k> :cprev<CR>
nmap <A-g> :cfirst<CR>
nmap <A-G> :clast<CR>

let g:which_key_map1.q = {
            \ 'name' : '+quickfix',
            \ 's' : 'set compile cmd',
            \ 'o' : 'open quickfix window',
            \ 'm' : 'make',
            \ 'c' : 'close quickfix window',
            \ 'e' : 'set quickfix list modifiable',
            \ 'w' : 'write quickfix list to a file'
            \}

" fold
set nofoldenable
syntax on

" vim-fugitive

nnoremap <silent><nowait> <space>ag :<C-u>G<space>
nnoremap <silent><nowait> <space>ac :<C-u>G commit -m<space>
nnoremap <silent><nowait> <space>al :<C-u>G log<CR>
nnoremap <silent><nowait> <space>ab :<C-u>G blame<CR>
nnoremap <silent><nowait> <space>as :<C-u>Gstatus<CR>
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
nnoremap <silent><nowait> <space>hq :<C-u>GitGutterQuickFix<CR>
nnoremap <silent><nowait> <space>hs :<C-u>GitGutterStageHunk<CR>
nnoremap <silent><nowait> <space>hu :<C-u>GitGutterUndoHunk<CR>
nnoremap <silent><nowait> <space>hp :<C-u>GitGutterPreviewHunk<CR>
nnoremap <silent><nowait> <space>hf :<C-u>GitGutterFold<CR>

let g:which_key_map1.h = {
            \ 'name' : '+git_diff',
            \ 'q' : 'open diff in quickfix window',
            \ 's' : 'stage the diff',
            \ 'u' : 'undo the diff',
            \ 'p' : 'preview the diff',
            \ 'f' : 'fold unchanged lines',
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
nnoremap <silent><nowait> <space>se :<C-u>:AsyncTaskEdit<CR>
nnoremap <silent><nowait> <space>sE :<C-u>:AsyncTaskEdit!<CR>
nnoremap <silent><nowait> <space>sg :<C-u>:AsyncTask git<CR>
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg','.yarn','.gitignore']
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 25 
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
            \ 'E' : 'edit global config',
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

" highlight some keywords

au BufEnter * :match Todo /FIXME\|TODO\|NOTE\|KEY\|IDEA\|CHANGED\|IDEA/

" modify file encoding
nmap <silent><nowait> <leader>e :set fenc=utf8<CR>
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16
let g:which_key_map2.e = "modify file encoding"

" coc-go
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" vim-zoom
map <c-w>o <c-w>m

" rainbow
let g:rainbow_active = 1

let g:rainbow_conf = {
            \	'ctermfgs': ['DarkBlue', 'DarkGreen', 'DarkCyan', 'DarkRed','DarkMagenta','Brown','DarkYellow','LightGray','LightGrey','Gray','Grey','DarkGray','DarkGrey','Blue','Green','Cyan','Red','Magenta','Yellow','White'],
            \	'operators': '_,\|+\|-\|*\|\/\|==\|!=_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'markdown': {
            \			'parentheses_options': 'containedin=markdownCode contained',
            \		},
            \ 		'vue' : {
            \			'parentheses': ['start=/{/ end=/}/ fold contains= containedin=@javaScript', 'start=/(/ end=/)/ fold contains=@javaScript containedin=@javaScript', 'start=/\v\<((script|style|area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold', 'start=/(/ end=/)/ fold'],
            \		},
            \	}
            \}

nnoremap <f1> :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
nnoremap <f2> :echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")<cr>
nnoremap <f3> :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
nnoremap <f4> :exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>

" coc-spell-checker
vmap <A-s> <Plug>(coc-codeaction-selected)<CR>
nmap <A-s> <Plug>(coc-codeaction-selected)<CR>

" vim-matchup
lua <<EOF
require'nvim-treesitter.configs'.setup {
matchup = {
enable = true,  -- mandatory, false will disable the whole extension
disable = {},  -- optional, list of language that will be disabled
disable_virtual_text = true,
include_match_words = {},
},
}
EOF
