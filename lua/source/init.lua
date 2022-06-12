local utils = require("utils")

local cmp = utils.fn.require("cmp")

local langList = {
	"go",
	"lua",
	"vue",
}

-- register custom sources
for _, value in pairs(langList) do
	local source = utils.fn.require("source/" .. value)
	cmp.register_source(value, source)
	cmp.setup.filetype(value, {
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = value },
		}, { { name = "buffer" }, { name = "path" } }),
	})
end
