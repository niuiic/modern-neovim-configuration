local utils = require("utils")
local filetypes = { "vue", "typescriptreact", "javascriptreact" }

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
end

local function search_ts_server_path()
	local local_ts_server_path = utils.fn.root_pattern() .. "/node_modules/typescript/lib"
	if utils.fn.file_or_dir_exists(local_ts_server_path .. "/lib.d.ts") then
		return local_ts_server_path
	else
		return os.getenv("HOME") .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
	end
end

local function copy_file_path()
	local name = vim.api.nvim_buf_get_name(0)
	local root_path = utils.fn.root_pattern()
	local index = string.find(name, root_path, 1, true)
	if index == nil then
		vim.notify("The file is not under the project", vim.log.levels.ERROR)
	else
		local str = string.sub(name, string.len(root_path) + 2)
		str = string.gsub(str, "^(src)", "@", 1)
		str = string.gsub(str, "(.[^.]*)$", "")
		vim.fn.setreg("+", str)
		vim.notify("Copied " .. str .. " to clipboard", vim.log.levels.INFO)
	end
end

local M = {
	filetypes = filetypes,
	root_dir = utils.fn.root_pattern,
	init_options = {
		typescript = {
			tsdk = search_ts_server_path(),
		},
	},
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
	},
}

return M
