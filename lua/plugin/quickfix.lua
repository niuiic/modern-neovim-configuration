return {
	config = function()
		require("quickfix").setup({
			hl_group = {
				{
					name = "QuickFixWarn",
					match = {
						"warn",
						"Warn",
						"warning",
						"WARN",
						"WARNING",
					},
					color = "#ff0000",
				},
				{
					name = "QuickFixErr",
					match = {
						"error",
						"Error",
						"ERROR",
					},
					color = "#ffff00",
				},
			},
		})
	end,
	dependencies = {
		"niuiic/niuiic-core.nvim",
	},
}
