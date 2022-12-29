-- keymap
require("which-key").register({
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
