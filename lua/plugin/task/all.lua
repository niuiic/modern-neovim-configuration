require("task").register_task({
	name = "open unstaged files",
	run = function()
		local root_dir = vim.fs.root(0, ".git")
		local results = vim.system({ "git", "diff", "--name-only" }, { cwd = root_dir }):wait().stdout or ""
		local files = vim.split(results, "\n")
		results = vim.system({ "git", "ls-files", "--others", "--exclude-standard" }, { cwd = root_dir }):wait().stdout
			or ""
		files = vim.list_extend(files, vim.split(results, "\n"))

		vim.iter(files)
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

require("task").register_task({
	name = "snap buffer",
	run = function()
		local filetype = vim.bo.filetype
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		local bufnr = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
		vim.api.nvim_win_set_buf(0, bufnr)
		vim.api.nvim_set_option_value("filetype", filetype, { buf = bufnr })
		vim.api.nvim_set_option_value("modified", false, { buf = bufnr })
	end,
})
