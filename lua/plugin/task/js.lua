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

require("task").register_task({
	name = "update divider",
	run = function()
		local get_class_node = function()
			local node = vim.treesitter.get_node()
			while node do
				if node:type() == "class_body" then
					return node
				end
				node = node:parent()
			end
		end

		local class_node = get_class_node()
		if not class_node then
			return
		end

		local insert_count = 0
		vim.iter(class_node:iter_children())
			:filter(function(node)
				return node:type() == "method_definition"
			end)
			:map(function(method_node)
				local name_node = vim.iter(method_node:iter_children()):find(function(x)
					return x:type() == "property_identifier"
				end)
				if not name_node then
					return function() end
				end
				local method_name = vim.treesitter.get_node_text(name_node, 0)

				local start_lnum
				local end_lnum
				local node_start_lnum = method_node:range()
				if method_node:prev_sibling() and method_node:prev_sibling():type() == "comment" then
					start_lnum = node_start_lnum - 1 + insert_count
					end_lnum = node_start_lnum + insert_count
				else
					start_lnum = node_start_lnum + insert_count
					end_lnum = node_start_lnum + insert_count
					insert_count = insert_count + 1
				end

				return function()
					vim.api.nvim_buf_set_lines(
						0,
						start_lnum,
						end_lnum,
						false,
						{ "// %%" .. " " .. method_name .. " " .. "%%" }
					)
				end
			end)
			:each(function(fn)
				fn()
			end)
	end,
	is_enabled = function()
		return vim.bo.filetype == "typescript"
	end,
})
