return {
	config = function()
		require("close_buffers").setup({})
	end,
	keys = {
		{ "<C-x>", "<cmd>BDelete this<CR>" },
	},
}
