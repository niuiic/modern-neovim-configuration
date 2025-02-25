require("task").register_task({
	name = "open unstaged files",
	run = function()
		local root_dir = vim.fs.root(0, ".git")
		local results = vim.fn.system({ "git", "diff", "--name-only" })

		vim.iter(vim.split(results, "\n"))
			:map(function(file)
				return vim.fs.joinpath(root_dir, file)
			end)
			:filter(function(file)
				return vim.fn.isdirectory(file) == 0
			end)
			:each(function(file)
				vim.cmd("e " .. file)
			end)
	end,
	is_enabled = function()
		return vim.fs.root(0, ".git")
	end,
})

require("task").register_task({
	name = "close all buffers",
	run = function()
		local buffers = vim.api.nvim_list_bufs()
		for _, bufnr in ipairs(buffers) do
			pcall(function()
				vim.cmd("bw! " .. bufnr)
			end)
		end
	end,
})
