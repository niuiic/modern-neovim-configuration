local get_class_node = function()
	local node = vim.treesitter.get_node()
	while node do
		if node:type() == "class_body" then
			return node
		end
		node = node:parent()
	end
end

local get_method_head_node = function(method_def_node)
	local node = method_def_node
	local prev_sibling = method_def_node:prev_sibling()

	while prev_sibling do
		if prev_sibling:type() == "method_definition" or prev_sibling:type() == "comment" then
			return node
		end

		node = prev_sibling
		prev_sibling = node:prev_sibling()
	end

	return node
end

local get_method_name_node = function(method_def_node)
	return vim.iter(method_def_node:iter_children()):find(function(node)
		return node:type() == "property_identifier"
	end)
end

require("task").register_task({
	name = "update divider",
	run = function()
		local class_node = get_class_node()
		if not class_node then
			return
		end

		local insert_count = 0
		local fns = vim.iter(class_node:iter_children())
			:filter(function(node)
				return node:type() == "method_definition"
			end)
			:map(function(method_def_node)
				local method_name_node = get_method_name_node(method_def_node)
				if not method_name_node then
					return function() end
				end
				local method_name = vim.treesitter.get_node_text(method_name_node, 0)

				local start_lnum
				local end_lnum
				local insert_line = "// %%" .. " " .. method_name .. " " .. "%%"
				local method_head_node = get_method_head_node(method_def_node)
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
	end,
	is_enabled = function()
		return vim.bo.filetype == "typescript" and get_class_node() ~= nil
	end,
})
