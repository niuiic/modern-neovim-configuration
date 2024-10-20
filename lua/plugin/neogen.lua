local keys = {
	{
		"<space>af",
		function()
			require("neogen").generate({
				type = "func",
			})
		end,
		desc = "function annotations",
	},
	{
		"<space>aF",
		function()
			require("neogen").generate({
				type = "file",
			})
		end,
		desc = "file annotations",
	},
	{
		"<space>ac",
		function()
			require("neogen").generate({
				type = "class",
			})
		end,
		desc = "class annotations",
	},
	{
		"<space>at",
		function()
			require("neogen").generate({
				type = "type",
			})
		end,
		desc = "type annotations",
	},
}

return {
	config = function()
		local neogen = require("neogen")

		neogen.setup({
			snippet_engine = "nvim",
		})
	end,
	keys = keys,
	dependencies = "nvim-treesitter/nvim-treesitter",
}
