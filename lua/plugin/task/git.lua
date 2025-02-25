require("task").register_task({
	name = "open unstaged files",
	run = function()
		local root_dir = vim.fs.root(0, ".git")
		local results = vim.fn.system({ "git", "diff", "--name-only" })

		vim.iter(vim.split(results, "\n"))
			:filter(function(file)
				return file ~= ""
			end)
			:map(function(file)
				return vim.fs.joinpath(root_dir, file)
			end)
			:each(function(file)
				vim.cmd("e " .. file)
			end)
	end,
	is_enabled = function()
		return vim.fs.root(0, ".git")
	end,
})
