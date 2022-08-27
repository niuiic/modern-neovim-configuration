local utils = require("utils")

utils.fn.require("filetype").setup({
	overrides = {
		extensions = {
			h = "c",
			hpp = "cpp",
			cpp = "cpp",
		},
	},
})
