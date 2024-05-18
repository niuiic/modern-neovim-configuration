return {
	config = function()
		require("track").setup({
			search = {
				entry_label = function(mark)
					local core = require("core")
					local root_path = core.file.root_path()
					local file = mark.file
					local index = string.find(mark.file, root_path, 1, true)
					if index then
						file = string.sub(file, string.len(root_path) + 2)
					end
					return string.format("[%s] %s | %s:%s", mark.id, mark.desc, file, mark.lnum)
				end,
			},
		})
	end,
	keys = {
		{
			"mm",
			function()
				require("track").toggle()
			end,
			desc = "toggle mark",
		},
		{
			"mc",
			function()
				require("track").remove()
			end,
			desc = "remove all marks",
		},
		{
			"mj",
			function()
				require("track").jump_to_next()
			end,
			desc = "jump to next mark",
		},
		{
			"mk",
			function()
				require("track").jump_to_prev()
			end,
			desc = "jump to prev mark",
		},
		{
			"me",
			function()
				require("track").edit()
			end,
			desc = "edit mark",
		},
		{
			"<space>om",
			function()
				require("track").search()
			end,
			desc = "search marks",
		},
	},
}
