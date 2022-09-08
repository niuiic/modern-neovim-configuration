local utils = require("utils")

utils.fn.whichKeyMap({
	l = {
		"<cmd>GlslView<CR>",
		"view glsl",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
