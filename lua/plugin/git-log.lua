return {
	config = function() end,
	keys = {
		{
			"<space>gb",
			function()
				require("git-log").check_log()
			end,
			desc = "git log",
			mode = { "x", "n" },
		},
	},
}
