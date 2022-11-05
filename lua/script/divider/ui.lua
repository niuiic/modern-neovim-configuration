local function create_win(width)
	if width == nil then
		width = 40
	end
	vim.api.nvim_command("vsplit")
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_win_set_buf(win, buf)
	vim.api.nvim_win_set_width(win, width)
end

local function create_hl_group(color_group)
	for i, color in ipairs(color_group) do
		vim.api.nvim_set_hl(0, "Divider" .. i, { fg = color })
	end
end

return {
	create_win = create_win,
	create_hl_group = create_hl_group,
}
