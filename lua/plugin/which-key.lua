return {
	config = function()
		require("which-key").setup({
			preset = "helix",
			spec = {
				{
					"<space>d",
					group = "debug",
				},
				{
					"<space>t",
					group = "test",
				},
				{
					"<space>g",
					group = "git signs",
				},
				{
					"<space>s",
					group = "tasks",
				},
				{
					"<space>l",
					group = "lsp",
				},
				{
					"<space>w",
					group = "window",
				},
				{
					"<space>a",
					group = "annotations",
				},
				{
					"<space>o",
					group = "fuzzy search",
					mode = { "n", "x" },
				},
				{
					"<space>b",
					group = "buffer line",
				},
				{
					"<space>m",
					group = "mark",
				},
				{
					"<space>q",
					group = "quickfix",
				},
				{
					"<leader>s",
					group = "session",
				},
				{
					"<leader>e",
					group = "remote",
				},
				{
					"<space>g",
					group = "git",
					mode = "x",
				},
				{
					"<leader>f",
					group = "fittencode",
					mode = { "n", "x" },
				},
			},
		})
	end,
}
