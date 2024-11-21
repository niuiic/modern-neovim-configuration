require("lsp-commands").register_command({
	name = "pyright/rename vars",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "pyright",
		})
	end,
	is_enabled = function()
		return require("tools.lsp_valid")("pyright")
	end,
})

return {}
