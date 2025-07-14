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
	name = "toggle to block visual mode",
	run = function()
		vim.fn.timer_start(100, function()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-v>", true, false, true), "n", false)
		end)
	end,
})

require("task").register_task({
	name = "search text globally (case sensitive)",
	run = function()
		require("telescope.builtin").live_grep({
			hidden = true,
			cwd = vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd(),
			additional_args = { "-s" },
		})
	end,
})

require("task").register_task({
	name = "open web previewer",
	run = function()
		vim.system(
			{
				"podman",
				"stop",
				"web-previewer",
			},
			vim.schedule_wrap(function()
				vim.system({
					"podman",
					"run",
					"--name",
					"web-previewer",
					"--rm",
					"-d",
					"-p",
					"10001:10001",
					"-p",
					"10002:10002",
					"-v",
					(vim.fs.root(0, ".git") or vim.fn.getcwd()) .. ":/app/workDir:ro",
					"-e",
					"SERVER_BASEURL=http://127.0.0.1:10001",
					"docker.io/niuiic/web-previewer",
				})
				vim.notify("web previewer is running at http://127.0.0.1:10002")
			end)
		)
	end,
})

require("task").register_task({
	name = "close web previewer",
	run = function()
		vim.system({
			"podman",
			"stop",
			"web-previewer",
		}, function()
			vim.notify("web previewer is closed")
		end)
	end,
})
