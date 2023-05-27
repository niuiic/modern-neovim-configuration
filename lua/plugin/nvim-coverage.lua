local use_toggle_coverage = function()
	local loaded = false
	local buf_list = {}
	local loaded_for_buf = function()
		local core = require("niuiic-core")
		if not loaded then
			return false
		end
		local bufnr = vim.api.nvim_win_get_buf(0)
		return core.lua.list.includes(buf_list, function(v)
			return v == bufnr
		end)
	end

	return function()
		if not loaded_for_buf() then
			require("coverage").load(true)
			loaded = true
		else
			require("coverage").clear()
			loaded = false
		end
		buf_list = vim.api.nvim_list_bufs()
	end
end

return {
	config = function()
		require("coverage").setup({
			commands = false,
			auto_reload = true,
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
