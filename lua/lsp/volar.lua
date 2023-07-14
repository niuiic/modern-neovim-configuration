local core = require("core")
local filetypes = { "vue", "typescriptreact", "javascriptreact" }

if core.file.file_contains(core.file.root_path() .. "/package.json", "vue") then
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
end

local function search_ts_server_path()
	local local_ts_server_path = core.file.root_path() .. "/node_modules/typescript/lib"
	if core.file.file_or_dir_exists(local_ts_server_path .. "/lib.d.ts") then
		return local_ts_server_path
	else
		return os.getenv("HOME") .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
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

local function organize_imports()
	local diagnostic_list = vim.diagnostic.get()
	local diagnostic = core.lua.list.find(diagnostic_list, function(diagnostic)
		return string.find(diagnostic.message, "Cannot find name") or string.find(diagnostic.message, "is not defined")
	end)
	if diagnostic == nil then
		return
	end
	local cur_pos = vim.api.nvim_win_get_cursor(0)
	vim.api.nvim_win_set_cursor(0, {
		diagnostic.lnum + 1,
		diagnostic.col,
	})
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(action)
			return action.title == "Add all missing imports"
				or string.find(action.title, "Update import from")
				or string.find(action.title, "Add import from")
		end,
	})
	vim.api.nvim_win_set_cursor(0, cur_pos)
end

local M = {
	filetypes = filetypes,
	root_dir = core.file.root_path,
	init_options = {
		typescript = {
			tsdk = search_ts_server_path(),
		},
	},
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
		VolarRename = {
			function()
				vim.lsp.buf.rename(nil, {
					name = "volar",
				})
			end,
			description = "Rename",
		},
		VolarFilePath = {
			copy_file_path,
			description = "File Path",
		},
		VolarOrganizeImports = {
			organize_imports,
			description = "File Path",
		},
	},
}

return M
