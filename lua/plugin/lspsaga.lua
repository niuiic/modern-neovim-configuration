local config = function()
	require("lspsaga").setup({})
end

return {
	event = "BufRead",
	config = config,
}
