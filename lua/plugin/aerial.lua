local utils = require("utils")

utils.fn.require("aerial").setup({
	layout = {
		min_width = 30,
	},
})

-- keymap
utils.fn.whichKeyMap({
	m = {
		function()
			if vim.bo.filetype == "markdown" then
				utils.fn.cmd("AerialToggle right")
			end
		end,
		"tagbar",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
