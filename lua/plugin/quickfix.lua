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
					color = "#ffff00",
				},
				{
					name = "QuickFixErr",
					match = {
						"error",
						"Error",
						"ERROR",
					},
					color = "#ff0000",
				},
			},
		})
	end,
	dependencies = {
		"niuiic/niuiic-core.nvim",
	},
}
