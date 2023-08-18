local get_output_path = function()
	local core = require("core")
	return core.file.root_path() .. "/output.pdf"
end

local to_pdf_path = function(file_path)
	local core = require("core")
	return string.format("%s/%s.pdf", core.file.dir(file_path), core.file.name(file_path))
end

local preview = function()
	local core = require("core")

	if vim.bo.filetype ~= "typst" then
		vim.notify("Not a typst file", vim.log.levels.WARN)
		return
	end

	local file_path = vim.api.nvim_buf_get_name(0)
	if not core.file.file_or_dir_exists(file_path) then
		vim.notify("Buffer not saved", vim.log.levels.WARN)
		return
	end

	local output_path = get_output_path()
	if not core.file.file_or_dir_exists(output_path) then
		vim.cmd(string.format("silent !typst compile %s %s", file_path, output_path))
	end

	core.job.spawn("mimeopen", {
		output_path,
	}, {}, function() end, function() end, function() end)
end

local clean_pdf = function()
	local core = require("core")

	vim.api.nvim_create_autocmd({ "VimLeave" }, {
		pattern = { "*" },
		callback = function()
			local output_path = get_output_path()
			if core.file.file_or_dir_exists(output_path) then
				pcall(vim.loop.fs_unlink, output_path)
			end
		end,
	})
end

local move_pdf = function()
	local core = require("core")

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "*" },
		callback = function(args)
			if vim.api.nvim_get_option_value("filetype", {
				buf = args.buf,
			}) ~= "typst" then
				return
			end

			local buf_name = vim.api.nvim_buf_get_name(args.buf)
			local pdf_path = to_pdf_path(buf_name)
			local timer

			timer = core.timer.set_interval(function()
				if not core.file.file_or_dir_exists(pdf_path) then
					return
				end

				vim.cmd(string.format("silent !mv %s %s", pdf_path, core.file.root_path() .. "/output.pdf"))
				core.timer.clear_interval(timer)
			end, 100)
		end,
	})
end

return {
	config = function()
		clean_pdf()
		move_pdf()
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
