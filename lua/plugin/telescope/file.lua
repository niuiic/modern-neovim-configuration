local search_file_in_workspace = function()
	require("telescope.builtin").find_files({
		hidden = true,
		cwd = vim.fs.root(0, ".git") or vim.fn.getcwd(),
		find_command = { "rg", "--files", "--glob", "!**/.git/*" },
	})
end

return {
	search_file_in_workspace = search_file_in_workspace,
}
