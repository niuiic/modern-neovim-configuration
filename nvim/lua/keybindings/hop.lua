utils = require("utils")

utils.fn.map("n", "f", ":HopChar1<CR>", utils.var.opt)
utils.fn.map("o", "f", ":HopChar1<CR>", utils.var.opt)
utils.fn.map("n", "F", ":HopLine<CR>", utils.var.opt)
utils.fn.map("o", "F", ":HopLine<CR>", utils.var.opt)
utils.fn.mapRegister({
	p = {
		"<cmd>CocList -A --normal yank<CR>",
		"clipboard history",
	},
}, {
	prefix = "<localleader>",
})
