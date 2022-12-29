local utils = require("utils")

local neogen = utils.fn.require("neogen")

neogen.setup({
	snippet_engine = "luasnip",
})

-- keymap
utils.fn.require("which-key").register({
	a = {
		name = "annotations",
		f = {
			function()
				neogen.generate({
					type = "func",
				})
			end,
			"function annotations",
		},
		F = {
			function()
				neogen.generate({
					type = "file",
				})
			end,
			"file annotations",
		},
		c = {
			function()
				neogen.generate({
					type = "class",
				})
			end,
			"class annotations",
		},
		t = {
			function()
				neogen.generate({
					type = "type",
				})
			end,
			"type annotations",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
