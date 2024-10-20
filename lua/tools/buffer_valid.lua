return function(bufnr)
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
	if vim.iter(exclude_filetypes):find(function(ft)
		return string.match(filetype, ft)
	end) then
		return false
	end

	local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
	local ok, name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if not ok or name == nil or name == "" or string.find(name, root_dir, 1, true) ~= 1 then
		return false
	end
	if not vim.uv.fs_stat(name) then
		return false
	end

	return true
end
