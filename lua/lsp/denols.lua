vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

require("lsp-commands").register_command({
	name = "denols/rename vars",
	run = function()
		vim.lsp.buf.rename(nil, {
			name = "denols",
		})
	end,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "denols",
		}) > 0
	end,
})

return {
	root_dir = function()
		return vim.fs.root(0, "deno.json") or vim.fn.getcwd()
	end,
	deno = {
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://jsr.io"] = true,
				},
			},
		},
	},
}
