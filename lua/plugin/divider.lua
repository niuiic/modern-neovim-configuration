return {
	config = function()
		require("divider").setup({
			dividers = {
				{
					regex = [[[^~]~ ([%s%S]+)]],
					hl = "#ff00ff",
					icon_hl = "#ff00ff",
					icon = "󰉋",
					extmark = "-",
					extmark_pos = "bottom",
				},
				{
					regex = [[[^~]~~ ([%s%S]+)]],
					hl = "#00a0ff",
					icon_hl = "#00a0ff",
					icon = "󰉋",
					extmark = "-",
					extmark_pos = "bottom",
				},
				{
					regex = [[~~~ ([%s%S]+)]],
					hl = "#00ff7c",
					icon_hl = "#00ff7c",
					icon = "󰉋",
					extmark = "-",
					extmark_pos = "bottom",
				},
			},
			enabled_filetypes = {
				"lua",
				"vue",
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"css",
				"scss",
				"html",
				"rust",
				"glsl",
				"wgsl",
				"python",
			},
			ui = { direction = "vl", size = 30 },
		})
	end,
	keys = {
		{ "<C-/>", "<cmd>DividerToggle<cr>", desc = "toggle divider list" },
	},
	lazy = false,
}
