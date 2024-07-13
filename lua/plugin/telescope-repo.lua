return {
	config = function()
		require("telescope").setup({
			extensions = {
				repo = {
					list = {
						fd_opts = {
							"-E",
							".local",
							"-E",
							".cargo",
						},
					},
				},
			},
		})
		require("telescope").load_extension("repo")
	end,
	keys = {
		{ "<space>oP", "<cmd>Telescope repo list<cr>", desc = "search projects" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
