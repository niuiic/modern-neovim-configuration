require("plugin.task.js.divider")

require("task").register_task({
	name = "run js project scripts",
	run = function()
		local scripts = vim.json.decode(
			vim.fn.join(vim.fn.readfile(vim.fs.root(0, "package.json") .. "/package.json"), "\n")
		).scripts

		if not scripts or vim.tbl_isempty(scripts) then
			vim.notify("no scripts found in package.json", vim.log.levels.WARN)
			return
		end

		local tasks = vim.tbl_keys(scripts)

		if #tasks == 1 then
			require("plugin.task.utils").run_in_term({
				"cd " .. vim.fs.root(0, "package.json"),
				"pnpm " .. tasks[1],
			})
			return
		end

		vim.ui.select(tasks, { prompt = "select script to run" }, function(choice)
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
		return vim.fs.root(0, "package.json") ~= nil
	end,
})

require("task").register_task({
	name = "run js file",
	run = function()
		require("plugin.task.utils").run_in_term({
			"deno " .. vim.api.nvim_buf_get_name(0),
		})
	end,
	is_enabled = function()
		return vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" and not vim.fs.root(0, "package.json")
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
