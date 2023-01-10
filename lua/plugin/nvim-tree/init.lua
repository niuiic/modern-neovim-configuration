local config_mod = require("plugin.nvim-tree.config")

local config = function()
	local nvim_tree = require("nvim-tree")

	nvim_tree.setup({
		-- don't show git status icon
		git = {
			enable = false,
		},
		-- for project plugin
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		-- hide some files and directories
		filters = {
			custom = { "^node_modules$", "^.git$" },
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = config_mod.view_no_float,
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = true,
			},
		},
		trash = {
			cmd = "trash-put",
			require_confirm = true,
		},
	})
end

return {
	config = config,
	keys = {
		{ "<space>p", "<cmd>NvimTreeToggle<CR>", desc = "toggle file tree" },
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}
