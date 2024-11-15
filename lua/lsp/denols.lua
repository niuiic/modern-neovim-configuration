vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

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
