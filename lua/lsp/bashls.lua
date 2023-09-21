local M = {
	filetypes = {
		"sh",
		"zsh",
	},
	commands = {
		BashlsRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "bashls",
				})
			end,
			description = "Rename",
		},
	},
}

return M
