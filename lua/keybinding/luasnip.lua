local utils = require("utils")

utils.fn.map("i", "<C-j>", "<Cmd>lua require('luasnip').expand_or_jump()<CR>", utils.var.opt)
utils.fn.map("i", "<C-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", utils.var.opt)
utils.fn.map("s", "<C-j>", "<Cmd>lua require('luasnip').jump(1)<CR>", utils.var.opt)
utils.fn.map("s", "<C-k>", "<Cmd>lua require('luasnip').jump(-1)<CR>", utils.var.opt)
