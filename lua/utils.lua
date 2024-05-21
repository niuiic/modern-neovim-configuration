local buffer_valid = function(bufnr)
	local core = require("core")

	local exclude_filetypes = {
		"terminal",
		"NvimTree",
		"Outline",
		"dap*",
	}

	local filetype = vim.api.nvim_get_option_value("filetype", {
		buf = bufnr,
	})
	if core.lua.list.includes(exclude_filetypes, function(ft)
		return string.match(filetype, ft)
	end) then
		return false
	end

	local root_path = core.file.root_path()
	local ok, name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if not ok or name == nil or name == "" or string.find(name, root_path, 1, true) ~= 1 then
		return false
	end
	if not core.file.file_or_dir_exists(name) then
		return false
	end
	return true
end

return {
	buffer_valid = buffer_valid,
}
