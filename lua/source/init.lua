local utils = require("utils")

local cmp = utils.fn.require("cmp")

local lang_list = {
	"go",
	"lua",
	"python",
}

-- register custom sources
for _, value in pairs(lang_list) do
	local M = utils.fn.require("source/" .. value)
	local source = {}
	function source:complete(_, callback)
		callback(M)
	end
	cmp.register_source(value, source)
	cmp.setup.filetype(value, {
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
	})
end
