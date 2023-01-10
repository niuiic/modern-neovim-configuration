local cd_dot_cb = function(node)
	require("nvim-tree").change_dir(require("utils").fn.root_pattern())
	if node.name ~= ".." then
		require("nvim-tree.lib").set_index_and_redraw(node.absolute_path)
	end
end

local list_keys = {
	-- open file or directory
	{ key = "l", action = "edit" },
	{ key = "L", action = "expand_all" },
	-- open file in split window
	{ key = "v", action = "vsplit" },
	{ key = "s", action = "split" },
	-- close node
	{ key = "h", action = "close_node" },
	{ key = "H", action = "collapse_all" },
	-- toggle the state of ignored files
	{ key = "i", action = "toggle_custom" }, -- filters
	-- toggle the state of  hidden files
	{ key = ".", action = "toggle_dotfiles" }, -- dotfiles
	-- toggle file info
	{ key = "I", action = "toggle_file_info" },
	-- preview file
	{ key = "P", action = "preview" },
	-- refresh (set root path to project root)
	{ key = "R", action = "cd_dot", action_cb = cd_dot_cb },
	-- close
	{ key = "q", action = "close" },
	-- mark
	{ key = "m", action = "toggle_mark" },
	-- file operations
	{ key = "a", action = "create" },
	{ key = "D", action = "remove" },
	{ key = "d", action = "trash" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "yy", action = "copy" },
	{ key = "yn", action = "copy_name" },
	{ key = "yp", action = "copy_path" },
	{ key = "ysp", action = "copy_absolute_path" },
	{ key = "p", action = "paste" },
}

local view_no_float = {
	width = 40,
	side = "left",
	hide_root_folder = false,
	mappings = {
		custom_only = true,
		list = list_keys,
	},
	number = false,
	relativenumber = false,
	signcolumn = "yes",
}

local view_float = {
	float = {
		enable = true,
		quit_on_focus_loss = true,
		open_win_config = {
			relative = "editor",
			border = "single",
			width = 40,
			height = vim.go.lines,
			row = 0,
			col = 0,
		},
	},
	hide_root_folder = false,
	mappings = {
		custom_only = true,
		list = list_keys,
	},
	number = false,
	relativenumber = false,
	signcolumn = "yes",
}

return {
	view_no_float = view_no_float,
	view_float = view_float,
}
