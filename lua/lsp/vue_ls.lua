local function copy_path()
	local name = vim.api.nvim_buf_get_name(0)
	local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
	local index = string.find(name, root_dir, 1, true)
	if index == nil then
		vim.notify("The file is not under the project", vim.log.levels.ERROR)
	else
		local str = string.sub(name, string.len(root_dir) + 2)
		str = string.gsub(str, "^(src)", "@", 1)
		if string.find(str, "^[%s%S]*.vue$") == nil then
			str = string.gsub(str, "(.[^.]*)$", "")
		end
		vim.fn.setreg("+", str)
		vim.notify("Copied " .. str .. " to clipboard", vim.log.levels.INFO)
	end
end

require("lsp-commands").register_command({
	name = "vue_ls/copy path",
	run = copy_path,
	is_enabled = function()
		return require("tools.lsp_valid")("vue_ls")
	end,
})

return {
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
	capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } },
}
