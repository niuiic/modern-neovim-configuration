local utils = require("utils")
local job = require("job")

local ns_id = vim.api.nvim_create_namespace("divider")

local function _pattern(search_result, content_regexp)
	if content_regexp == nil then
		return nil
	end

	local lines = {}
	local content_list = {}
	for _, value in ipairs(search_result) do
		local matched_line_str = string.match(value, "(%d+):%d+")
		if matched_line_str then
			table.insert(lines, tonumber(matched_line_str))
		end
		local content = string.match(value, content_regexp)
		if content then
			table.insert(content_list, content)
		end
	end

	return { lines = lines, content_list = content_list }
end

local function _highlight_divider(lines, highlight)
	for _, line in ipairs(lines) do
		vim.api.nvim_buf_add_highlight(0, ns_id, highlight, line - 1, 0, -1)
	end
end

local function _get_divider_info(line, level, content)
	local prefix = "#" .. level .. ":"
	local temp = level
	while temp > 1 do
		prefix = prefix .. "  "
		temp = temp - 1
	end
	return {
		line = line,
		level = level,
		content = vim.api.nvim_buf_get_name(0) .. "|" .. line .. "| " .. prefix .. content,
	}
end

local function _set_loclist(dividers)
	table.sort(dividers, function(cur, next)
		if cur.line < next.line then
			return true
		else
			return false
		end
	end)
	local loclist = {}
	for _, value in ipairs(dividers) do
		table.insert(loclist, value.content)
	end
	vim.fn.setloclist(0, {}, "r", {
		lines = loclist,
	})
end

local function divide(divider_config)
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
	local dividers = {}
	for level, pattern in ipairs(divider_config) do
		local search_res = job.search(pattern.divider_pattern)
		if #search_res == 0 then
			goto continue
		end

		local pattern_res = _pattern(search_res, pattern.content_pattern)
		if pattern_res == nil then
			goto continue
		end

		_highlight_divider(pattern_res.lines, "Divider" .. level)

		if pattern.list then
			for index, value in ipairs(pattern_res.content_list) do
				table.insert(dividers, _get_divider_info(pattern_res.lines[index], level, value))
			end
		end

		::continue::
	end
	_set_loclist(dividers)
end

return {
	divide = divide,
}
