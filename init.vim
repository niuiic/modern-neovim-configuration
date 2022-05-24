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
" require source/*
lua << EOF
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/source', [[v:val =~ '\.lua$']])) do
    require('source.'..file:gsub('%.lua$', ''))
    end
EOF

" modify file encoding
nmap <silent><nowait> <leader>e :set fenc=utf8<CR>
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16

" fold
" set nofoldenable
" syntax on
" autocmd VimEnter * setlocal foldmethod=manual
" au BufRead set foldmethod=manual " this is covered by unknown configuration
" augroup remember_folds
"     autocmd!
"     au BufWinLeave ?* mkview 1
"     au BufWinEnter ?* silent! loadview 1
" augroup END

" vim-translator
nnoremap <silent><expr> <C-[> translator#window#float#has_scroll() ?
            \ translator#window#float#scroll(1) : "\<C=[>"
nnoremap <silent><expr> <C-]> translator#window#float#has_scroll() ?
            \ translator#window#float#scroll(0) : "\<C-[>"
