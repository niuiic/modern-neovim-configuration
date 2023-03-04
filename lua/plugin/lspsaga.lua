local config = function()
	require("lspsaga").setup({
		lightbulb = {
			sign_priority = 1,
		},
	})
end

return {
	event = "BufRead",
	config = config,
}
