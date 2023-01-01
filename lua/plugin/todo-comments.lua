local config = function()
	require("todo-comments").setup({
		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "DANGER", "HACK", "MARK" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			FAKE = { icon = "", color = "fake" },
			TEMP = { icon = "", color = "temp" },
			QUESTION = { icon = "", color = "question", alt = { "Q" } },
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			fake = { "Fake", "#A6E22E" },
			temp = { "Temp", "#D52CD5" },
			question = { "Questions", "#00ffd5" },
		},
	})
end

local keys = {
	{
		"gT",
		function()
			require("todo-comments").jump_prev()
		end,
		desc = "jump to previous todo comment",
	},
	{
		"gt",
		function()
			require("todo-comments").jump_next()
		end,
		desc = "jump to next todo comment",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = "nvim-lua/plenary.nvim",
	lazy = false,
}
