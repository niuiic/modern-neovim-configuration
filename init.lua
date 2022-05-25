require("plugins")
require("basic")

local directories = { "plugin", "keybinding", "lsp", "dap", "snippet", "source" }

for _, value in pairs(directories) do
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. value, [[v:val =~ '\.lua$']])) do
		require(value .. "." .. file:gsub("%.lua$", ""))
	end
end

vim.cmd([[
" modify file encoding
nmap <silent><nowait> <leader>e :set fenc=utf8<CR>
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16

" fold
augroup remember_folds
    autocmd!
    au BufWinLeave ?* mkview 1
    au BufWinEnter ?* silent! loadview 1
augroup END

" vim-translator
nnoremap <silent><expr> <C-[> translator#window#float#has_scroll() ?
            \ translator#window#float#scroll(1) : "\<C=[>"
nnoremap <silent><expr> <C-]> translator#window#float#has_scroll() ?
            \ translator#window#float#scroll(0) : "\<C-[>"
]])
