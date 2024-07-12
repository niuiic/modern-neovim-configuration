local config = function()
	require("Comment").setup({
		ignore = "^$",
		mappings = false,
	})

	require("ts-comments").setup({})
end

return { config = config, dependencies = { "" } }
