return {
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, ".root") or vim.fs.root(bufnr, ".git") or vim.fn.getcwd())
	end,
}
