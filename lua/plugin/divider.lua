return {
	config = function()
		require("divider").setup({
			dividers = {
				{
					regex = [[[^~]~ ([%s%S]+)]],
					hl = "#ff00ff",
					icon_hl = "#ff00ff",
					icon = "󰍎",
					extmark = "-",
					extmark_pos = "bottom",
				},
				{
					regex = [[[^~]~~ ([%s%S]+)]],
					hl = "#00a0ff",
					icon_hl = "#00a0ff",
					icon = "󰐾",
					extmark = "-",
					extmark_pos = "bottom",
				},
				{
					regex = [[~~~ ([%s%S]+)]],
					hl = "#00ff7c",
					icon_hl = "#00ff7c",
					hide = true,
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
			ui = { direction = "vl" },
		})
	end,
	keys = {
		{ "<leader>ll", "<cmd>DividerToggle<cr>", desc = "toggle divider list" },
		{ "<leader>lp", "<cmd>CopyDividers<cr>", desc = "copy dividers to clipboard" },
	},
	lazy = false,
}
