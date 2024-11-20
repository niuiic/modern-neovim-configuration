require("lsp-commands").register_command("rename vars", {
	name = "pyright",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "pyright",
		})
	end,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "pyright",
		}) > 0
	end,
})

return {}
