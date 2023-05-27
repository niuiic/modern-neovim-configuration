return {
	config = function()
		vim.api.nvim_set_hl(0, "LspSignature", { bg = "#2f5c82" })
		require("lsp_signature").setup({
			hi_parameter = "LspSignature",
			hint_enable = false,
			floating_window = false,
		})
	end,
	keys = {
		{
			"K",
			function()
				vim.lsp.buf.signature_help()
			end,
		},
	},
	event = "VimEnter",
}
