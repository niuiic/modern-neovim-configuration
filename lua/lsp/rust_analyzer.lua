-- check more commands here
-- https://github.com/rust-lang/rust-analyzer/blob/master/editors/code/package.json
-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/dev/lsp-extensions.md

local core = require("core")

local M = {
	root_dir = core.file.root_path,
	commands = {
		RustAnalyzerRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "rust_analyzer",
				})
			end,
			description = "Rename",
		},
	},
}

return M
