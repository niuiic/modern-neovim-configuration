local config = function()
	local nvim_tree = require("nvim-tree")

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
		root_dirs = { require("niuiic-core").file.root_path() },
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
			cmd = "trash put",
			require_confirm = true,
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			local opts = function(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			vim.keymap.set("n", "l", api.node.open.edit, opts("open"))
			vim.keymap.set("n", "P", api.node.open.preview, opts("preview"))
			vim.keymap.set("n", "a", api.fs.create, opts("create"))
			vim.keymap.set("n", "y", api.fs.copy.node, opts("copy"))
			vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("toggle hidden files"))
			vim.keymap.set("n", "yp", api.fs.copy.absolute_path, opts("copy absolute path"))
			vim.keymap.set("n", "yP", api.fs.copy.relative_path, opts("copy relative path"))
			vim.keymap.set("n", "p", api.fs.paste, opts("paste"))
			vim.keymap.set("n", "q", api.tree.close, opts("close"))
			vim.keymap.set("n", "<esc>", api.tree.close, opts("close"))
			vim.keymap.set("n", "r", api.fs.rename, opts("rename"))
			vim.keymap.set("n", "R", api.tree.reload, opts("reload"))
			vim.keymap.set("n", "s", api.tree.search_node, opts("search"))
			vim.keymap.set("n", "H", api.tree.collapse_all, opts("collapse all"))
			vim.keymap.set("n", "x", api.fs.cut, opts("cut"))
		end,
	})
end

return {
	config = config,
	keys = {
		{ "<space>oF", "<cmd>NvimTreeFocus<CR>", desc = "open file tree" },
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}
