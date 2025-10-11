return {
	name = "plantuml",
	cmd = {
		"/root/.go/bin/plantuml-lsp",
		"--stdlib-path=" .. vim.fs.joinpath(vim.fn.stdpath("data"), "plantuml-stdlib"),
	},
	filetypes = { "plantuml" },
	root_markers = { ".git" },
}
