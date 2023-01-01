return {
	config = function()
		local autopairs = require("nvim-autopairs")
		local rule = require("nvim-autopairs.rule")

		autopairs.setup({})
		autopairs.remove_rule("'")
		autopairs.add_rule(rule("'", "'", "-rust"))
	end,
}
