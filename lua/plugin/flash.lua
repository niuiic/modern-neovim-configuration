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
				require("flash").jump({ search = { mode = "search" }, jump = { pos = "end" } })
			end,
			desc = "flash",
			mode = { "n", "x", "o" },
		},
		{
			"F",
			function()
				require("flash").jump({ search = { mode = "search" }, jump = { pos = "start" } })
			end,
			desc = "flash",
			mode = { "n", "x", "o" },
		},
		{
			"W",
			function()
				require("flash").jump({
					search = { mode = "search", max_length = 0 },
					label = { after = { 0, 0 } },
					pattern = "[\\u4e00-\\u9fa5]",
				})
			end,
			desc = "flash",
			mode = { "n", "x", "o" },
		},
		{
			"L",
			function()
				require("flash").jump({
					search = { mode = "search", max_length = 0 },
					label = { after = { 0, 0 } },
					pattern = "^",
				})
			end,
			desc = "flash",
			mode = { "n", "x", "o" },
		},
		{
			"T",
			function()
				require("flash").treesitter()
			end,
			desc = "flash treesitter",
			mode = { "n", "x", "o" },
		},
	},
	event = "VeryLazy",
}
