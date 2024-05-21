local core = require("core")

return {
	root_dir = core.file.root_path,
	commands = {
		DartlsRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "dartls",
				})
			end,
			description = "Rename",
		},
	},
}
