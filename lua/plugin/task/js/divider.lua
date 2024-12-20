local M = {}

function M.register_task()
	require("task").register_task({
		name = "update class divider",
		run = M.update_class_divider,
		is_enabled = function()
			return vim.bo.filetype == "typescript" and M.get_class_node() ~= nil
		end,
	})
end

function M.update_class_divider()
	local class_node = M.get_class_node()
	if not class_node then
		return
	end

	local insert_count = 0
	local fns = vim.iter(class_node:iter_children())
		:filter(function(node)
			return node:type() == "method_definition"
		end)
		:map(function(method_def_node)
			local method_name_node = M.get_method_name_node(method_def_node)
			if not method_name_node then
				return function() end
			end
			local method_name = vim.treesitter.get_node_text(method_name_node, 0)

			local start_lnum
			local end_lnum
			local insert_line = "// %%" .. " " .. method_name .. " " .. "%%"
			local method_head_node = M.get_method_head_node(method_def_node)
			local node_start_lnum = method_head_node:range()
			if method_head_node:prev_sibling() and method_head_node:prev_sibling():type() == "comment" then
				start_lnum = node_start_lnum - 1 + insert_count
				end_lnum = node_start_lnum + insert_count
			else
				start_lnum = node_start_lnum + insert_count
				end_lnum = node_start_lnum + insert_count
				insert_count = insert_count + 1
			end

			return function()
				vim.api.nvim_buf_set_lines(0, start_lnum, end_lnum, false, { insert_line })
			end
		end)
		:totable()
	for _, fn in ipairs(fns) do
		fn()
	end
end

function M.get_class_node()
	local node = vim.treesitter.get_node()
	while node do
		if node:type() == "class_body" then
			return node
		end
		node = node:parent()
	end
end

function M.get_method_head_node(method_def_node)
	local node = method_def_node
	local prev_sibling = method_def_node:prev_sibling()

	while prev_sibling do
		if vim.list_contains({ "method_definition", "comment", "{" }, prev_sibling:type()) then
			return node
		end

		node = prev_sibling
		prev_sibling = node:prev_sibling()
	end

	return node
end

function M.get_method_name_node(method_def_node)
	return vim.iter(method_def_node:iter_children()):find(function(node)
		return node:type() == "property_identifier"
	end)
end

M.register_task()
