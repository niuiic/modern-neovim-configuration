require("plugin.task.js.divider")

require("task").register_task({
	name = "run node task",
	run = function()
		local tasks = vim.json.decode(
			vim.fn.join(vim.fn.readfile(vim.fs.root(0, "package.json") .. "/package.json"), "\n")
		).scripts

		if not tasks or vim.tbl_isempty(tasks) then
			vim.notify("no scripts found in package.json", vim.log.levels.WARN)
			return
		end

		tasks = vim.tbl_keys(tasks)

		if #tasks == 1 then
			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"pnpm " .. tasks[1],
			})
			return
		end

		vim.ui.select(tasks, { prompt = "select task to run" }, function(choice)
			if not choice then
				return
			end

			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"pnpm " .. choice,
			})
		end)
	end,
	is_enabled = function()
		return vim.fs.root(0, "package.json") ~= nil and not require("tools.is_deno_project")()
	end,
})

require("task").register_task({
	name = "run js file",
	run = function()
		if vim.api.nvim_buf_get_name(0):match("%.ts$" or vim.api.nvim_buf_get_name(0):match("%.mts$")) then
			require("plugin.task.utils").run_in_term({
				"pnpx tsx " .. vim.api.nvim_buf_get_name(0),
			})
			return
		end

		require("plugin.task.utils").run_in_term({
			"node " .. vim.api.nvim_buf_get_name(0),
		})
	end,
	is_enabled = function()
		if require("tools.is_deno_project")() then
			return false
		end

		local file_name = vim.api.nvim_buf_get_name(0)

		return file_name:match("%.js$" or file_name:match("%.mjs$"))
			or file_name:match("%.ts$" or file_name:match("%.mts$"))
	end,
})

require("task").register_task({
	name = "run ts file",
	run = function()
		require("plugin.task.utils").run_in_term({
			"deno run -A " .. vim.api.nvim_buf_get_name(0),
		})
	end,
	is_enabled = function()
		return require("tools.is_deno_project")()
	end,
})

require("task").register_task({
	name = "run benchmark",
	run = function()
		require("plugin.task.utils").run_in_term({ "deno bench -A " .. vim.api.nvim_buf_get_name(0) })
	end,
	is_enabled = function()
		return require("tools.is_deno_project")()
	end,
})

require("task").register_task({
	name = "run test",
	run = function()
		require("plugin.task.utils").run_in_term({ "deno test -A " .. vim.api.nvim_buf_get_name(0) })
	end,
	is_enabled = function()
		return require("tools.is_deno_project")()
	end,
})

require("task").register_task({
	name = "run deno task",
	run = function()
		local tasks =
			vim.json.decode(vim.fn.join(vim.fn.readfile(vim.fs.root(0, "deno.json") .. "/deno.json"), "\n")).tasks

		if not tasks or vim.tbl_isempty(tasks) then
			vim.notify("no scripts found in package.json", vim.log.levels.WARN)
			return
		end

		tasks = vim.tbl_keys(tasks)

		if #tasks == 1 then
			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"deno task " .. tasks[1],
			})
			return
		end

		vim.ui.select(tasks, { prompt = "select task to run" }, function(choice)
			if not choice then
				return
			end

			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"deno task " .. choice,
			})
		end)
	end,
	is_enabled = function()
		return require("tools.is_deno_project")()
	end,
})

require("task").register_task({
	name = "toggle parameters",
	run = function()
		vim.lsp.buf.code_action({
			apply = true,
			filter = function(action)
				return string.find(action.title, "Convert parameters to destructured object") ~= nil
			end,
		})
	end,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "vtsls",
		}) > 0
	end,
})

require("task").register_task({
	name = "infer function return type",
	run = function()
		vim.lsp.buf.code_action({
			apply = true,
			filter = function(action)
				return string.find(action.title, "Infer function return type") ~= nil
			end,
		})
	end,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "vtsls",
		}) > 0
	end,
})
