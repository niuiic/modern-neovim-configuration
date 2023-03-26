return {
	config = function()
		require("divider").setup({
			dividers = {
				{
					divider_regex = [[%%=+ [\s\S]+ =+%%]],
					content_regex = [[%%%%=+ ([%s%S]*) =+%%%%]],
					hl = "#ff00ff",
					icon = "",
				},
				{
					divider_regex = [[%%-+ [\s\S]+ -+%%]],
					content_regex = [[%%%%%-+ ([%s%S]*) %-+%%%%]],
					hl = "#ffff00",
					icon = "",
				},
				{
					divider_regex = [[%% [\s\S]+ %%]],
					content_regex = [[%%%% ([%s%S]*) %%%%]],
					hl = "#00ff7c",
					icon = "",
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
		})
	end,
	keys = {
		{ "<leader>l", "<cmd>DividerToggle<CR>", desc = "toggle divider list" },
	},
	lazy = false,
}
