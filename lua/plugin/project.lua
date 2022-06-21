local utils = require("utils")

utils.fn.require("project_nvim").setup({
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

utils.fn.require("telescope").load_extension("projects")
