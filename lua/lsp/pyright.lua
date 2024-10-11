return {
	commands = {
		PyrightRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "pyright",
				})
			end,
			description = "Rename",
		},
	},
}
