local use_toggle_coverage = function()
	local loaded = false
	return function()
		if not loaded then
			require("coverage").load()
			require("coverage").toggle()
			loaded = true
		else
			require("coverage").toggle()
			loaded = false
		end
	end
end

return {
	config = function()
		require("coverage").setup({
			commands = false,
			highlights = {
				covered = { fg = "#00e800" },
				partial = { fg = "#c3ff00" },
				uncovered = { fg = "#f00000" },
			},
			signs = {
				covered = { hl = "CoverageCovered", text = "" },
				partial = { hl = "CoveragePartial", text = "" },
				uncovered = { hl = "CoverageUncovered", text = "" },
			},
			summary = {
				min_coverage = 80.0,
			},
			lang = {},
		})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<space>tc",
			use_toggle_coverage(),
			desc = "toggle test coverage",
		},
		{
			"<space>tl",
			function()
				require("coverage").load()
				require("coverage").summary()
			end,
			desc = "view test coverage summary",
		},
		{
			"<space>tj",
			function()
				require("coverage").jump_next("uncovered")
			end,
			desc = "jump to next uncovered",
		},
		{
			"<space>tk",
			function()
				require("coverage").jump_prev("uncovered")
			end,
			desc = "jump to previous uncovered",
		},
	},
}
