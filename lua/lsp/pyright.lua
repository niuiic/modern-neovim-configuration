local core = require("core")

return {
	root_dir = core.file.root_path,
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
