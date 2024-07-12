local config = function()
	require("Comment").setup({
		mappings = {
			basic = false,
			extra = false,
			extended = false,
		},
		ignore = "^$",
	})

	require("ts-comments").setup()
end

return {
	config = config,
	dependencies = { "folke/ts-comments.nvim" },
	keys = {
		{ "<C-a>", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
		{ "<C-a>", "<Plug>(comment_toggle_linewise_current)" },
	},
}
