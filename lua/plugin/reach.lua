local utils = require("utils")

utils.fn.require("reach").setup({})

-- delete all marks
utils.fn.map("n", "<A-m>", "<cmd>:delm a-z A-z<CR>", utils.var.opt)
