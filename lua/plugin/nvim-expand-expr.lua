local utils = require("utils")

-- keymap
utils.fn.map({
	e = {
		function()
			require("expand_expr").expand()
		end,
		"expand and repeat expression to multiple lines",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
