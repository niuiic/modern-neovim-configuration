local utils = require("utils")

local cmp = require("cmp")

-- register custom sources
for _, value in pairs(utils.var.langList) do
	local source = utils.fn.require("source/" .. value)
	cmp.register_source(value, source)
	cmp.setup.filetype(value, {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = value },
		}, { { name = "buffer" }, { name = "path" } }),
	})
end
