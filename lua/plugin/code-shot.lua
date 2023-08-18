return {
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
