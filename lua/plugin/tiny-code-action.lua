return {
	config = function()
		require("tiny-code-action").setup()
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
