local utils = require("utils")
local filetypes = { "vue" }

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
end

local function search_ts_server_path()
	local local_ts_server_path = utils.fn.root_pattern() .. "/node_modules/typescript/lib"
	if utils.fn.file_exists(local_ts_server_path .. "/lib.d.ts") then
		return local_ts_server_path
	else
		return os.getenv("HOME") .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
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
}

return M
