local prev_winnr
local winnr
local win_size

local close_nvim_tree = function()
	vim.api.nvim_win_set_config(winnr, {
		width = 1,
		height = 1,
		border = "none",
	})
	vim.api.nvim_set_current_win(prev_winnr)
end

local set_keymap = function(bufnr)
	local core = require("core")
	local api = require("nvim-tree.api")
	local opts = function(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	vim.keymap.set("n", "l", function()
		api.node.open.edit()
		local node = api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			close_nvim_tree()
		end
	end, opts("open"))
	vim.keymap.set("n", "a", api.fs.create, opts("create"))
	vim.keymap.set("n", "y", api.fs.copy.node, opts("copy"))
	vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("toggle hidden files"))
	vim.keymap.set("n", "yP", api.fs.copy.absolute_path, opts("copy absolute path"))
	vim.keymap.set("n", "yp", api.fs.copy.relative_path, opts("copy relative path"))
	vim.keymap.set("n", "p", api.fs.paste, opts("paste"))
	vim.keymap.set("n", "Q", api.tree.close, opts("close"))
	vim.keymap.set("n", "q", close_nvim_tree, opts("close"))
	vim.keymap.set("n", "<esc>", close_nvim_tree, opts("close"))
	vim.keymap.set("n", "r", api.fs.rename, opts("rename"))
	vim.keymap.set("n", "d", function()
		local node = api.tree.get_node_under_cursor()
		if node == nil then
			return
		end
		local target_buf = core.lua.list.find(vim.api.nvim_list_bufs(), function(v)
			return string.find(vim.api.nvim_buf_get_name(v), node.absolute_path, 1, true) == nil
		end)
		if target_buf then
			require("mini.bufremove").delete(target_buf)
		end
		api.fs.remove()
	end, opts("remove"))
	vim.keymap.set("n", "R", api.tree.reload, opts("reload"))
	vim.keymap.set("n", "f", function()
		api.tree.find_file({ buf = vim.api.nvim_win_get_buf(prev_winnr) })
	end, opts("focus on current file"))
	vim.keymap.set("n", "H", api.tree.collapse_all, opts("collapse all"))
	vim.keymap.set("n", "L", function()
		vim.api.nvim_win_set_cursor(0, { 1, 1 })
		api.tree.expand_all()
	end, opts("expand all"))
	vim.keymap.set("n", "x", api.fs.cut, opts("cut"))
	vim.keymap.set("n", "<C-f>", api.live_filter.start, opts("filter"))
	vim.keymap.set("n", "<C-l>", api.live_filter.clear, opts("filter"))
	vim.keymap.set("n", "o", function()
		local node = api.tree.get_node_under_cursor()
		if node == nil then
			return
		end
		if not vim.fn.executable("dolphin") then
			vim.notify("dolphin is required", vim.log.levels.ERROR)
			return
		end
		core.job.spawn("dolphin", {
			"--select",
			node.absolute_path,
		}, {}, function() end, function() end)
	end, opts("open with dolphin"))
end

local open_nvim_tree = function()
	if winnr == vim.api.nvim_get_current_win() then
		return
	end

	prev_winnr = vim.api.nvim_get_current_win()

	if winnr == nil or not vim.api.nvim_win_is_valid(winnr) then
		require("nvim-tree.api").tree.open({
			path = require("core").file.root_path(),
			find_file = true,
		})
		winnr = vim.api.nvim_get_current_win()
		return
	end

	vim.api.nvim_win_set_config(winnr, {
		border = "rounded",
		width = win_size.width,
		height = win_size.height,
	})
	vim.api.nvim_set_current_win(winnr)
end

local config = function()
	local nvim_tree = require("nvim-tree")
	local core = require("core")
	win_size = core.win.proportional_size(0.8, 0.8)

	nvim_tree.setup({
		git = {
			enable = false,
		},
		update_cwd = true,
		filters = {
			custom = { "^node_modules$", "^.git$" },
		},
		ui = {
			confirm = {
				remove = false,
			},
		},
		root_dirs = { core.file.root_path() },
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
				quit_on_focus_loss = false,
				open_win_config = function()
					return {
						border = "rounded",
						relative = "editor",
						row = win_size.row,
						col = win_size.col,
						width = win_size.width,
						height = win_size.height,
					}
				end,
			},
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		actions = {
			open_file = {
				quit_on_open = false,
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
		on_attach = set_keymap,
		trash = {
			cmd = "trash put",
			require_confirm = true,
		},
	})
end

return {
	config = config,
	keys = {
		{
			"<C-b>",
			open_nvim_tree,
			desc = "open file tree",
		},
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}
