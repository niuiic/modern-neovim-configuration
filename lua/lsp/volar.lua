local function search_ts_server_path()
	local local_ts_server_path = (vim.fs.root(0, ".git") or vim.fn.getcwd()) .. "/node_modules/typescript/lib"
	if vim.uv.fs_stat(local_ts_server_path .. "/lib.d.ts") then
		return local_ts_server_path
	else
		return os.getenv("HOME")
			.. "/.local/share/nvim/mason/packages/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib"
	end
end

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
	name = "volar/copy path",
	run = copy_path,
	is_enabled = function()
		return #vim.lsp.get_clients({
			name = "volar",
		}) > 0
	end,
})

return {
	init_options = {
		typescript = {
			tsdk = search_ts_server_path(),
		},
	},
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
	capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } },
}
