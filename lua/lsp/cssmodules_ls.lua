local utils = require("utils")

local M = {
	root_dir = utils.fn.root_pattern,
	filetypes = { "javascriptreact", "typescriptreact", "vue" },
}

return M
