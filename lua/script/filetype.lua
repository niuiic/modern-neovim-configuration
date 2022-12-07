local get_file_extension = function()
	local file_path = vim.api.nvim_buf_get_name(0)
	local extension = string.match(file_path, ".([%w]+)$")
	return extension
end

local custom_filetype_list = {
	h = "c",
	sh = "sh",
	hpp = "cpp",
	vert = "glsl",
	tesc = "glsl",
	tese = "glsl",
	geom = "glsl",
	frag = "glsl",
	comp = "glsl",
	rgen = "glsl",
	rint = "glsl",
	rahit = "glsl",
	rchit = "glsl",
	rmiss = "glsl",
	rcall = "glsl",
}

local function set_filetypes()
	local file_extension = get_file_extension()
	if file_extension == nil then
		vim.notify("failed to get file extension", "error")
		return
	end
	for key, value in pairs(custom_filetype_list) do
		if key == file_extension then
			vim.bo.filetype = value
			break
		end
	end
end

vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
	pattern = "*",
	callback = function()
		set_filetypes()
	end,
})
