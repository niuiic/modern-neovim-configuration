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
				confirm = "r",
			},
			regexOptions = {
				pcre2 = false,
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
