require("lsp-commands").register_command({
	name = "bashls/rename var",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "bashls",
		})
	end,
	is_enabled = function()
		return require("tools.lsp_valid")("bashls")
	end,
})

return {
	filetypes = {
		"sh",
		"zsh",
	},
}
