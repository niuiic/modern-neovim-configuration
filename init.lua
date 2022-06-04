require("basic")
require("keymap")
require("plugins")
require("source")
require("snippet")

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
]])
