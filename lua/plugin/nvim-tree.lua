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
	local api = require("nvim-tree.api")
	local opts = function(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	local cut_files = {}
	local cut_dirs = {}
	vim.keymap.set("n", "l", function()
		api.node.open.edit()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end
		if node.type == "file" then
			close_nvim_tree()
		end
	end, opts("open"))
	vim.keymap.set("n", "a", api.fs.create, opts("create"))
	vim.keymap.set("n", "y", api.fs.copy.node, opts("copy"))
	vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("toggle hidden files"))
	vim.keymap.set("n", "yP", api.fs.copy.absolute_path, opts("copy absolute path"))
	vim.keymap.set("n", "yp", api.fs.copy.relative_path, opts("copy relative path"))
	vim.keymap.set("n", "p", function()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end
		api.fs.paste()
		for _, path in ipairs(cut_files) do
			require("track").notify_file_path_change(
				path[1],
				node.type == "file" and node.parent.absolute_path or node.absolute_path .. "/" .. path[2]
			)
		end
		for _, path in ipairs(cut_dirs) do
			require("track").notify_dir_path_change(
				path[1],
				node.type == "file" and node.parent.absolute_path or node.absolute_path .. "/" .. path[2]
			)
		end
		cut_files = {}
		cut_dirs = {}
	end, opts("paste"))
	vim.keymap.set("n", "q", close_nvim_tree, opts("close"))
	vim.keymap.set("n", "<esc>", close_nvim_tree, opts("close"))
	vim.keymap.set("n", "r", function()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end
		local old = node.absolute_path
		api.fs.rename()
		local new = api.tree.get_node_under_cursor().absolute_path
		if node.type == "file" then
			require("track").notify_file_path_change(old, new)
		else
			require("track").notify_dir_path_change(old, new)
		end
	end, opts("rename"))
	vim.keymap.set("n", "d", function()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end
		local target_buf = vim.iter(vim.api.nvim_list_bufs()):find(function(x)
			return string.find(vim.api.nvim_buf_get_name(x), node.absolute_path, 1, true) ~= nil
		end)
		if target_buf then
			require("mini.bufremove").delete(target_buf)
		end
		api.fs.remove()
		if node.type == "file" then
			require("track").notify_file_path_change(node.absolute_path)
		else
			require("track").notify_dir_path_change(node.absolute_path)
		end
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
	vim.keymap.set("n", "x", function()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end
		api.fs.cut()
		if node.type == "file" then
			table.insert(
				cut_files,
				{ node.absolute_path, string.match(node.absolute_path, node.parent.absolute_path .. "/(.*)") }
			)
		else
			table.insert(
				cut_dirs,
				{ node.absolute_path, string.match(node.absolute_path, node.parent.absolute_path .. "/(.*)") }
			)
		end
	end, opts("cut"))
	vim.keymap.set("n", "<C-f>", api.live_filter.start, opts("filter"))
	vim.keymap.set("n", "<C-l>", api.live_filter.clear, opts("filter"))
	vim.keymap.set("n", "o", function()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end
		if not vim.fn.executable("dolphin") then
			vim.notify("dolphin is required", vim.log.levels.ERROR)
			return
		end
		vim.system({ "dolphin", "--select", node.absolute_path })
	end, opts("open with dolphin"))
	vim.keymap.set("n", "t", function()
		local node = api.tree.get_node_under_cursor()
		if not node then
			return
		end

		local dir_path = node.absolute_path
		if vim.fn.isdirectory(dir_path) == 0 then
			dir_path = string.match(dir_path, "(.*)/[^/]+")
		end

		close_nvim_tree()

		vim.fn.timer_start(100, function()
			local on_term_opened = require("terminal.static").config.on_term_opened
			require("terminal").open(nil, nil, function(buf, pid, channel)
				on_term_opened(buf, pid, channel)

				local enter = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
				vim.defer_fn(function()
					vim.api.nvim_chan_send(channel, "cd " .. dir_path .. enter)
				end, 100)
			end)
		end)
	end, opts("open with terminal"))
end

local open_nvim_tree = function()
	if winnr == vim.api.nvim_get_current_win() then
		return
	end

	prev_winnr = vim.api.nvim_get_current_win()

	if winnr == nil or not vim.api.nvim_win_is_valid(winnr) then
		require("nvim-tree.api").tree.open({
			path = vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd(),
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
	local screen_w = vim.opt.columns:get()
	local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
	win_size = {
		col = 0,
		row = 1,
		height = screen_h - 4,
		width = screen_w,
	}

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
		root_dirs = { vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd() },
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
						return prev_winnr
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
			"<C-p>",
			open_nvim_tree,
			desc = "open file tree",
		},
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
}
