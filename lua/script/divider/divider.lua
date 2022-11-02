local job = require("job")

local ns_id = vim.api.nvim_create_namespace("divider")

--- get lines from pos
local function get_lines(pos)
	local matched_lines = {}
	for _, value in ipairs(pos) do
		local matched_line_str = string.match(value, "(%d+):%d+")
		if matched_line_str then
			table.insert(matched_lines, tonumber(matched_line_str))
		end
	end
	return matched_lines
end

local function highlight_divider(pattern, highlight)
	local results = job.search(pattern)
	if #results == 0 then
		return
	end

	local matched_lines = get_lines(results)

	for _, line in ipairs(matched_lines) do
		vim.api.nvim_buf_add_highlight(0, ns_id, highlight, line - 1, 0, -1)
	end
end

local function divide(pattern_group)
	vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
	for i, pattern in ipairs(pattern_group) do
		highlight_divider(pattern, "Divider" .. i)
	end
end

local function listDivider()
	local file_path = vim.api.nvim_buf_get_name(0)
	vim.api.nvim_command([[lgrep "===========================" ]] .. file_path)
	-- local ui = require("ui")
	-- ui.create_win()
end

vim.api.nvim_create_user_command("ListDivider", listDivider, {})

return {
	listDivider = listDivider,
	divide = divide,
}
