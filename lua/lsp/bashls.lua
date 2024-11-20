require("lsp-commands").register_command("rename vars", {
	name = "bashls",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "bashls",
		})
	end,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "bashls",
		}) > 0
	end,
})

return {
	filetypes = {
		"sh",
		"zsh",
	},
}
