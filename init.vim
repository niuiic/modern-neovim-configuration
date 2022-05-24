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
