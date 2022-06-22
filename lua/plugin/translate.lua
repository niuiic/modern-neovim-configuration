local utils = require("utils")

utils.fn.require("translate").setup({
	default = {
		-- translate-shell is required
		command = "translate_shell",
		output = "floating",
		parse_after = "window",
	},
})

utils.fn.map("v", "<C-t>", ":Translate ZH-CN -source=EN<CR>", utils.var.opt)
utils.fn.map("v", "<A-t>", ":Translate EN -source=ZH-CN -output=insert<CR>", utils.var.opt)
