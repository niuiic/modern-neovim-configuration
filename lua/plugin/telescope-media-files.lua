return {
	config = function()
		require("telescope").setup({
			extensions = {
				media_files = {
					filetypes = { "png", "jpg", "jpeg", "svg" },
				},
			},
		})
		require("telescope").load_extension("media_files")
	end,
	keys = {
		{ "<space>op", "<cmd>Telescope media_files<CR>", desc = "search media files" },
	},
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
