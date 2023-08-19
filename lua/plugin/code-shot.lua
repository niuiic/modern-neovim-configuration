return {
	config = function()
		require("code-shot").setup({
			options = function()
				return {
					"--theme",
					"Solarized (dark)",
					"--font",
					"Hack Nerd Font",
				}
			end,
		})
	end,
	keys = {
		{
			"<space>P",
			function()
				require("code-shot").shot()
			end,
			desc = "code shot",
			mode = { "n", "v" },
		},
	},
}
