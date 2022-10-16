local utils = require("utils")

utils.fn.require("lightspeed").setup({
	ignore_case = true,
	safe_labels = { "f", "F" },
})

utils.fn.map("n", "s", "s", utils.var.opt)
utils.fn.map("n", "S", "S", utils.var.opt)
utils.fn.map("v", "s", "s", utils.var.opt)
utils.fn.map("v", "S", "S", utils.var.opt)
utils.fn.map("n", "f", "<Plug>Lightspeed_s", utils.var.opt)
utils.fn.map("n", "F", "<Plug>Lightspeed_S", utils.var.opt)
utils.fn.map("v", "f", "<Plug>Lightspeed_s", utils.var.opt)
utils.fn.map("v", "F", "<Plug>Lightspeed_S", utils.var.opt)
