return {
	config = function()
		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})
		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "",
				right = "",
			},
			hi = {
				background = "None",
			},
			options = {
				multiple_diag_under_cursor = true,
			},
		})
		vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextError", { fg = "#DB4B4B" })
		vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextWarn", { fg = "#E0AF68" })
		vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextInfo", { fg = "#0DB9D7" })
		vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextHint", { fg = "#00FFCC" })
	end,
	event = "BufRead",
}
