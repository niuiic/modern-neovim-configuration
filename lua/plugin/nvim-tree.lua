local config = function()
	local nvim_tree = require("nvim-tree")
	local win_config = require("niuiic-core").win.proportional_size(0.6, 0.6)

	nvim_tree.setup({
		git = {
			enable = false,
		},
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		filters = {
			custom = { "^node_modules$", "^.git$" },
		},
		ui = {
			confirm = {
				remove = false,
			},
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
					return {
						border = "rounded",
						relative = "editor",
						row = win_config.row,
						col = win_config.col,
						width = win_config.width,
						height = win_config.height,
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
						return require("window-picker").pick_window({
							picker_config = {
								statusline_winbar_picker = {
									use_winbar = "always",
								},
							},
							show_prompt = false,
							filter_rules = {
								bo = {
									filetype = { "NvimTree", "notify", "noice" },
									buftype = { "terminal" },
								},
							},
						})
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
			vim.keymap.set("n", "d", function()
				local node = api.tree.get_node_under_cursor()
				if node == nil then
					return
				end
				local target_buf = require("niuiic-core").lua.list.find(vim.api.nvim_list_bufs(), function(v)
					return string.find(vim.api.nvim_buf_get_name(v), node.absolute_path, 1, true)
				end)
				if target_buf then
					require("mini.bufremove").delete(target_buf)
				end
				api.fs.remove()
			end, opts("remove"))
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
		{
			"<space>oF",
			function()
				require("nvim-tree.api").tree.open({
					path = require("niuiic-core").file.root_path(),
					find_file = true,
				})
			end,
			desc = "open file tree",
		},
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}
