local utils = require("utils")

local filetypes = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
}

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "none" }
end

local M = {
	filetypes = filetypes,
	init_options = {
		hostInfo = "neovim",
	},
	root_dir = utils.fn.root_pattern,
}

return M
