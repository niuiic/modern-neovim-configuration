return {
	config = function()
		local ai = require("mini.ai")

		require("mini.ai").setup({
			custom_textobjects = {
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
			},
			silent = true,
		})
	end,
}
