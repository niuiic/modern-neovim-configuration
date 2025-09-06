return {
	keys = {
		{
			"<space>le",
			function()
				require("otter").activate({
					"javascript",
					"typescript",
					"python",
				})
			end,
			desc = "embed language server",
		},
	},
}
