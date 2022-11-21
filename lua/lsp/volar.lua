local utils = require("utils")
local filetypes = { "vue" }

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
end

local M = {
	filetypes = filetypes,
	root_dir = utils.fn.root_pattern,
	init_options = {
		typescript = {
			tsdk = os.getenv("HOME")
				.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib",
		},
	},
}

return M
