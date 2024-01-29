return {
	config = function()
		require("divider").setup({
			dividers = {
				{
					regex = [[%-%-%-%- ([%s%S]*) %-%-%-%-]],
					hl = "#ff00ff",
					icon_hl = "#ff00ff",
					icon = "",
				},
				{
					regex = [[%-%-%- ([%s%S]*) %-%-%-]],
					hl = "#00ff7c",
					icon_hl = "#00ff7c",
					icon = "",
				},
				{
					regex = [[%-%- ([%s%S]*) %-%-]],
					hl = "#ffa000",
					icon_hl = "#ffa000",
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
				"go",
			},
			ui = { direction = "vl" },
		})
	end,
	keys = {
		{ "<leader>ll", "<cmd>DividerToggle<CR>", desc = "toggle divider list" },
		{ "<leader>lp", "<cmd>CopyDividers<CR>", desc = "copy dividers to clipboard" },
	},
	lazy = false,
}
