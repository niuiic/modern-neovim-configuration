local utils = require("utils")

utils.fn.map("v", "<A-j>", ":MoveBlock(1)<CR>", utils.var.opt)
utils.fn.map("v", "<A-k>", ":MoveBlock(-1)<CR>", utils.var.opt)
utils.fn.map("v", "<A-l>", ":MoveHBlock(1)<CR>", utils.var.opt)
utils.fn.map("v", "<A-h>", ":MoveHBlock(-1)<CR>", utils.var.opt)
