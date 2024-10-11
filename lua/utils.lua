local buffer_valid = function(bufnr)
	local omega = require("omega")

	if not vim.api.nvim_buf_is_valid(bufnr) then
		return false
	end

	local exclude_filetypes = {
		"terminal",
		"NvimTree",
		"Outline",
		"dap+",
	}
	local filetype = vim.api.nvim_get_option_value("filetype", {
		buf = bufnr,
	})
	if omega.list_find(exclude_filetypes, function(ft)
		return string.match(filetype, ft)
	end) then
		return false
	end

	local root_dir = omega.root_pattern(".git") or vim.fn.getcwd()
	local ok, name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if not ok or name == nil or name == "" or string.find(name, root_dir, 1, true) ~= 1 then
		return false
	end
	if not omega.exist(name) then
		return false
	end

	return true
end

return {
	buffer_valid = buffer_valid,
}
