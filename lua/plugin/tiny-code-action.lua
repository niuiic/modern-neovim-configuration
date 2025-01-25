return {
	config = function()
		require("tiny-code-action").setup({
			telescope_opts = {
				layout_strategy = "cursor",
				layout_config = {
					width = 0.6,
					height = 0.3,
					preview_cutoff = 1,
					prompt_position = "top",
				},
			},
		})
	end,
	keys = {
		{
			"<space>la",
			function()
				require("tiny-code-action").code_action({})
			end,
			desc = "code action",
		},
	},
}
