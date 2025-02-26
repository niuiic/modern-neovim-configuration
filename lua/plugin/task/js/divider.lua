local M = {}

function M.register_task()
	require("task").register_task({
		name = "update dividers",
		run = M._update_dividers,
		is_enabled = function()
			return vim.list_contains(
				{ "typescript", "javascript", "typescriptreact", "javascriptreact" },
				vim.bo.filetype
			)
		end,
	})
end

function M._update_dividers()
	local parser = vim.treesitter.get_parser(0)
	local tree = parser:parse()[1]
	local root = tree:root()

	local dividers = {}

	for node in root:iter_children() do
		if node:type() == "export_statement" then
			local lnum = M._get_divider_lnum(node)
			dividers[lnum] = M._get_divider_text(node)
		end
	end

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local new_lines = {}
	for lnum, line in ipairs(lines) do
		if dividers[lnum] then
			if M._is_top_level_divider(line) then
				table.insert(new_lines, string.format("// %% %s %%", dividers[lnum]))
			else
				table.insert(new_lines, line)
				table.insert(new_lines, string.format("// %% %s %%", dividers[lnum]))
			end
		else
			table.insert(new_lines, line)
		end
	end
	vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

-- lnum start from 1
function M._get_divider_lnum(node)
	local lnum = node:start()
	local n = node:prev_sibling()

	while n do
		if n:type() ~= "comment" then
			return lnum
		end

		if n:type() == "comment" and M._is_top_level_divider(vim.treesitter.get_node_text(n, 0)) then
			return n:start() + 1
		end

		lnum = n:start()
		n = n:prev_sibling()
	end

	return lnum
end

function M._is_top_level_divider(line)
	return line:match("%% (.*) %%")
end

function M._get_divider_text(node)
	local export_node
	for n in node:iter_children() do
		if n:type():match("declaration") then
			export_node = n
			break
		end
	end

	for n in export_node:iter_children() do
		if n:type():match("identifier") and n:type() ~= "type_identifier" then
			return vim.treesitter.get_node_text(n, 0)
		end

		if n:type() == "variable_declarator" then
			for m in n:iter_children() do
				if m:type() == "identifier" then
					return vim.treesitter.get_node_text(m, 0)
				end
			end
		end
	end
end

M.register_task()
