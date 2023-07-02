return {
	config = function()
		require("flash").setup({
			label = {
				rainbow = {
					enabled = true,
				},
			},
			jump = {
				autojump = true,
				pos = "end",
			},
			modes = {
				char = {
					enabled = false,
				},
			},
		})
	end,
	keys = {
		{
			"f",
			function()
				require("flash").jump({ search = { mode = "search" } })
			end,
			desc = "flash",
			mode = { "n", "x", "o" },
		},
		{
			"F",
			function()
				require("flash").treesitter()
			end,
			desc = "flash treesitter",
			mode = { "n", "x", "o" },
		},
	},
	event = "VeryLazy",
}
