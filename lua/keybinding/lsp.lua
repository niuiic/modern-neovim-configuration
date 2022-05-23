local lspKeymaps = {}
local utils = require("utils")

lspKeymaps.map = function(mapbuf)
    -- rename
    mapbuf("n", "gr", "<cmd>Lspsaga rename<CR>", utils.var.opt)
    -- code action
    mapbuf("n", "ga", "<cmd>Lspsaga code_action<CR>", utils.var.opt)
    mapbuf("x", "ga", ":<c-u>Lspsaga range_code_action<cr>", utils.var.opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", utils.var.opt)
    mapbuf("n", "gh", "<cmd>Lspsaga signature_help<CR>", utils.var.opt)
    mapbuf("n", "K", "<cmd>Lspsaga hover_doc<cr>", utils.var.opt)
    mapbuf("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", utils.var.opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", utils.var.opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", utils.var.opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", utils.var.opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", utils.var.opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", utils.var.opt)
    -- scroll window
    mapbuf("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", utils.var.opt)
    mapbuf("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", utils.var.opt)
end

return lspKeymaps
