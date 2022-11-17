local utils = require("utils")

utils.fn.require("todo-comments").setup({
	keywords = {
		FIX = {
			icon = " ",
			color = "error",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "DANGER", "HACK" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		FAKE = { icon = "", color = "fake" },
		TEMP = { icon = "", color = "temp" },
		VERIFY = { icon = "", color = "verify" },
	},
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		fake = { "Fake", "#A6E22E" },
		temp = { "Temp", "#D52CD5" },
		verify = { "Verify", "#00ffd5" },
	},
})
