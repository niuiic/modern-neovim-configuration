local to_pdf = function(file_name)
	local core = require("core")

	return string.format("%s/%s.pdf", core.file.dir(file_name), core.file.name(file_name))
end

local preview = function()
	local core = require("core")

	if vim.bo.filetype ~= "typst" then
		vim.notify("Not a typst file", vim.log.levels.WARN)
		return
	end

	local file_name = vim.api.nvim_buf_get_name(0)
	if not core.file.file_or_dir_exists(file_name) then
		vim.notify("Buffer not saved", vim.log.levels.WARN)
		return
	end

	local pdf = to_pdf(file_name)
	if not core.file.file_or_dir_exists(pdf) then
		vim.notify("No output found", vim.log.levels.WARN)
		return
	end

	core.job
		.spawn("mimeopen", {
			pdf,
		}, {}, function() end, function() end, function() end)
		.terminate()
end

local pdf_list = {}

local collect_pdf = function()
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		pattern = { "*" },
		callback = function()
			if not vim.bo.filetype == "typst" then
				return
			end
			local buf_name = vim.api.nvim_buf_get_name(0)
			table.insert(pdf_list, to_pdf(buf_name))
		end,
	})
end

local clean_pdf = function()
	local core = require("core")

	vim.api.nvim_create_autocmd({ "VimLeave" }, {
		pattern = { "*" },
		callback = function()
			core.lua.list.each(pdf_list, function(pdf)
				if core.file.file_or_dir_exists(pdf) then
					pcall(vim.loop.fs_unlink, pdf)
				end
			end)
		end,
	})
end

return {
	config = function()
		collect_pdf()
		clean_pdf()
	end,
	keys = {
		{
			"<leader>P",
			function()
				preview()
			end,
			desc = "preview typst",
		},
	},
	ft = "typst",
	lazy = false,
}
