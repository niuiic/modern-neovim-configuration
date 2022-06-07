local utils = require("utils")

local nvim_tree = utils.fn.require("nvim-tree")
local lib = utils.fn.require("nvim-tree.lib")
local cd_dot_cb = function(node)
	nvim_tree.change_dir(require("utils").fn.rootPattern())
	if node.name ~= ".." then
		lib.set_index_and_redraw(node.absolute_path)
	end
end

local list_keys = {
	-- open file or directory
	{ key = "l", action = "edit" },
	-- open file in split window
	{ key = "v", action = "vsplit" },
	{ key = "s", action = "split" },
	-- close node
	{ key = "h", action = "close_node" },
	-- toggle the state of ignored files
	{ key = "i", action = "toggle_custom" }, -- filters
	-- toggle the state of  hidden files
	{ key = ".", action = "toggle_dotfiles" }, -- dotfiles
	-- toggle file info
	{ key = "t", action = "toggle_file_info" },
	-- preview file
	{ key = "P", action = "preview" },
	-- refresh (set root path to project root)
	{ key = "R", action = "cd_dot", action_cb = cd_dot_cb },
	-- close
	{ key = "q", action = "close" },
	-- file operations
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "D", action = "trash" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "yy", action = "copy" },
	{ key = "yn", action = "copy_name" },
	{ key = "yp", action = "copy_path" },
	{ key = "ysp", action = "copy_absolute_path" },
	{ key = "p", action = "paste" },
}

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
		dotfiles = true,
		custom = { "node_modules" },
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
	view = {
		width = 40,
		side = "left",
		hide_root_folder = false,
		mappings = {
			custom_only = false,
			list = list_keys,
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	actions = {
		open_file = {
			resize_window = true,
			quit_on_open = true,
		},
	},
})

-- keymap
utils.fn.whichKeyMap({
	p = {
		"<cmd>NvimTreeToggle<CR>",
		"toggle file tree",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
