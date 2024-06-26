return {
	config = function()
		require("rip-substitute").setup({
			popupWin = {
				border = "rounded",
			},
			prefill = {
				normal = false,
			},
			keymaps = {
				abort = "<esc>",
			},
		})
	end,
	keys = {
		{
			"r",
			function()
				require("rip-substitute").sub()
			end,
			mode = { "n", "x" },
			desc = "rip substitute",
		},
	},
}
