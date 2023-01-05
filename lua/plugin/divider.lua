return {
	config = function()
		require("divider").setup({
			dividers = {
				{
					divider_pattern = [[%%=+ [\s\S]+ =+%%]],
					content_pattern = [[%%%%=+ ([%s%S]*) =+%%%%]],
					hl = "#ff00ff",
					list = true,
				},
				{
					divider_pattern = [[%%-+ [\s\S]+ -+%%]],
					content_pattern = [[%%%%%-+ ([%s%S]*) %-+%%%%]],
					hl = "#ffff00",
					list = true,
				},
				{
					divider_pattern = [[%% [\s\S]+ %%]],
					content_pattern = [[%%%% ([%s%S]*) %%%%]],
					hl = "#00ff7c",
					list = false,
				},
			},
		})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
