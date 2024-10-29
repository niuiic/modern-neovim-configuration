local function js(selection, expr_prev)
	return string.format([[console.log('%s %s = ', %s)]], expr_prev, selection, selection)
end
local function lua(selection, expr_prev)
	return string.format([[print("%s %s = ", vim.inspect(%s))]], expr_prev, selection, selection)
end
local function rust(selection, expr_prev)
	return string.format([[println!("%s %s = {:?}", %s);]], expr_prev, selection, selection)
end

local function get_print_expr(selection, expr_prev)
	local getters = {
		javascript = js,
		javascriptreact = js,
		typescript = js,
		typescriptreact = js,
		vue = js,
		lua = lua,
		rust = rust,
	}

	local getter = getters[vim.bo.filetype] or getters["default"]
	return getter(selection, expr_prev)
end

local count = 0
local symbol = "QUICK_PRINT"
local function get_expr_prev()
	count = count + 1
	local lnum = vim.api.nvim_win_get_cursor(0)[1]
	local file_name = vim.api.nvim_buf_get_name(0)
	local root_dir = vim.fs.root(0, ".git")
	if root_dir then
		file_name = file_name:match(root_dir .. "/(.*)")
	end
	return string.format("[%s] %s(%s:%s)", count, symbol, file_name, lnum)
end

local function quick_print()
	local selection = require("omega").get_selection()[1]
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local print_expr = get_print_expr(selection, get_expr_prev())
	vim.api.nvim_buf_set_lines(0, cursor_pos[1], cursor_pos[1], false, { print_expr })
	require("omega").to_normal_mode()
	vim.api.nvim_win_set_cursor(0, { cursor_pos[1] + 1, cursor_pos[2] })
end

return quick_print
