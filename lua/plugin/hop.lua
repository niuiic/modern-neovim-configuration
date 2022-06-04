local utils = require("utils")

utils.fn.require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

-- keymap
utils.fn.map("n", "f", ":HopChar1<CR>", utils.var.opt)
utils.fn.map("o", "f", ":HopChar1<CR>", utils.var.opt)
utils.fn.map("n", "F", ":HopChar2<CR>", utils.var.opt)
utils.fn.map("o", "F", ":HopChar2<CR>", utils.var.opt)
utils.fn.map("n", "L", ":HopLineStart<CR>", utils.var.opt)
utils.fn.map("o", "L", ":HopLineStart<CR>", utils.var.opt)
