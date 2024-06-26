local core = require("core")

local function search_ts_server_path()
	local local_ts_server_path = core.file.root_path() .. "/node_modules/typescript/lib"
	if core.file.file_or_dir_exists(local_ts_server_path .. "/lib.d.ts") then
		return local_ts_server_path
	else
		return os.getenv("HOME")
			.. "/.local/share/nvim/mason/packages/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib"
	end
end

local function copy_file_path()
	local name = vim.api.nvim_buf_get_name(0)
	local root_path = core.file.root_path()
	local index = string.find(name, root_path, 1, true)
	if index == nil then
		vim.notify("The file is not under the project", vim.log.levels.ERROR)
	else
		local str = string.sub(name, string.len(root_path) + 2)
		str = string.gsub(str, "^(src)", "@", 1)
		if string.find(str, "^[%s%S]*.vue$") == nil then
			str = string.gsub(str, "(.[^.]*)$", "")
		end
		vim.fn.setreg("+", str)
		vim.notify("Copied " .. str .. " to clipboard", vim.log.levels.INFO)
	end
end

local M = {
	root_dir = core.file.root_path,
	init_options = {
		typescript = {
			tsdk = search_ts_server_path(),
		},
	},
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
	modify_capabilities = function(capabilities)
		if capabilities.workspace == nil then
			capabilities.workspace = {
				didChangeWatchedFiles = { dynamicRegistration = true },
			}
		else
			capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
		end
	end,
	commands = {
		VolarFilePath = {
			copy_file_path,
			description = "File Path",
		},
	},
}

return M
