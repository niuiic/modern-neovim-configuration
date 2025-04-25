return {
	config = function()
		if vim.fn.getenv("WSL_INTEROP") == vim.NIL then
			require("im-switch").setup({})
		end
	end,
}
