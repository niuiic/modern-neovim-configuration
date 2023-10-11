return {
	config = function()
		require("neodev").setup({
			override = function(_, library)
				library.enabled = true
				library.plugins = true
			end,
		})
	end,
}
