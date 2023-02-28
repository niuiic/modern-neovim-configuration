local config = function()
	require("lspsaga").setup({
		lightbulb = {
			enable = false,
		},
	})
end

return {
	event = "BufRead",
	config = config,
}
