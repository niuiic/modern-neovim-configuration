return {
	config = function()
		require("part-edit").setup({
			delete_buf_on_leave = true,
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
	},
}
