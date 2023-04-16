return {
	config = function()
		require("telescope").load_extension("recent_files")
	end,
	keys = {
		{
			"<space>oh",
			function()
				require("telescope").extensions.recent_files.pick()
			end,
			desc = "search media files",
		},
	},
	dependencies = { "nvim-telescope/telescope.nvim" },
}
