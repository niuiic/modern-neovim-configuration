return {
	keys = {
		{ "<space>oP", "<cmd>Telescope repo list<CR>", desc = "search projects" },
	},
	config = function()
		require("telescope").load_extension("repo")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
