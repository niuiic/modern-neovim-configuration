local config = function()
	local nvim_tree = require("nvim-tree")

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
		{ key = "<esc>", action = "close" },
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

	local HEIGHT_RATIO = 0.6
	local WIDTH_RATIO = 0.6

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
		view = {
			float = {
				enable = true,
				quit_on_focus_loss = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local window_w = screen_w * WIDTH_RATIO
					local window_h = screen_h * HEIGHT_RATIO
					local window_w_int = math.floor(window_w)
					local window_h_int = math.floor(window_h)
					local center_x = (screen_w - window_w) / 2
					local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
					return {
						border = "single",
						relative = "editor",
						row = center_y,
						col = center_x,
						width = window_w_int,
						height = window_h_int,
					}
				end,
			},
			hide_root_folder = false,
			mappings = {
				custom_only = true,
				list = list_keys,
			},
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		actions = {
			open_file = {
				quit_on_open = true,
				resize_window = true,
				window_picker = {
					picker = function()
						return require("window-picker").pick_window()
					end,
				},
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
		{ "<space>oF", "<cmd>NvimTreeFindFile<CR>", desc = "open file tree" },
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}
