return {
	config = function()
		require("NeoColumn").setup({
			custom_NeoColumn = {
				vue = { 120 },
			},
			excluded_ft = { "terminal", "git" },
		})
	end,
}
