return {
	config = function()
		require("track").setup({
			search = {
				entry_label = function(mark)
					local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
					local file = mark.file
					local index = string.find(mark.file, root_dir, 1, true)
					if index then
						file = string.sub(file, string.len(root_dir) + 2)
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
			"mM",
			function()
				if require("track").is_marked() then
					require("track").unmark()
					return
				end
				local desc = (require("omega").get_selection() or { "" })[1]
				require("track").mark(nil, nil, nil, desc)
				require("omega").to_normal_mode()
			end,
			desc = "toggle mark",
			mode = { "n", "x" },
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
			"mE",
			function()
				if not require("track").is_marked() then
					return
				end
				local desc = (require("omega").get_selection() or { "" })[1]
				require("track").edit(nil, nil, desc)
				require("omega").to_normal_mode()
			end,
			desc = "edit mark",
			mode = { "n", "x" },
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
