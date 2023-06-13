return {
	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.lsp")
				require("hover.providers.gh")
				require("hover.providers.gh_user")
				require("hover.providers.man")
			end,
		})
	end,
	keys = {
		{
			"J",
			function()
				require("hover").hover()
			end,
			silent = true,
		},
	},
}
