local config = function()
	local spectre = require("spectre")

	spectre.setup({
		live_update = true,
		open_cmd = "new",
		mapping = {
			["enter_file"] = {
				map = "<cr>",
				cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
				desc = "goto current file",
			},
			["run_current_replace"] = {
				map = "r",
				cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
				desc = "replace current line",
			},
			["run_replace"] = {
				map = "R",
				cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
				desc = "replace all",
			},
		},
	})

	require("which-key").register({
		r = {},
	}, {
		mode = "v",
		prefix = "<leader>",
	})
end

local keys = {
	{
		"<leader>rW",
		function()
			require("spectre").open_visual({ select_word = true })
		end,
		desc = "replace current word",
	},
	{
		"<leader>rw",
		function()
			require("spectre").open_file_search({ select_word = true })
		end,
		desc = "replace in current file",
	},
	{
		"<leader>rr",
		function()
			require("spectre").open()
		end,
		desc = "replace",
	},
	{
		"<leader>r",
		function()
			require("spectre").open_visual()
		end,
		desc = "replace in project",
		mode = "v",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = "nvim-lua/plenary.nvim",
}
