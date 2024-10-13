vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

return {
	root_dir = function()
		return vim.fs.root(0, ".git") or vim.fn.getcwd()
	end,
}
