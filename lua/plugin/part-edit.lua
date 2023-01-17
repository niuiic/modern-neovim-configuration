return {
	config = function()
		require("part-edit").setup({
			win = {
				width_ratio = 0.8,
				height_ratio = 0.8,
			},
		})
	end,
	keys = {
		{
			"<space>p",
			":<c-u>PartEdit<CR>",
			desc = "edit selected code",
			mode = "v",
			silent = true,
		},
		{
			"<space>p",
			"<cmd>PartEdit<CR>",
			desc = "exit part editing",
		},
	},
}
