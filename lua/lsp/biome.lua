local function fix_all()
	vim.cmd("w")
	vim.system({ "biome", "lint", vim.api.nvim_buf_get_name(0) }, {}, function()
		vim.schedule(function()
			vim.cmd("e")
		end)
	end)
end

require("lsp-commands").register_command({
	name = "biome/fix all",
	run = fix_all,
})

return {}
