local config = function()
	local telescope = require("telescope")
	local trouble = require("trouble.sources.telescope")

	telescope.setup({
		defaults = {
			layout_strategy = "vertical",
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<esc>"] = "close",
					["<C-q>"] = "close",
					["<C-b>"] = "preview_scrolling_up",
					["<C-f>"] = "preview_scrolling_down",
					["<C-u>"] = "results_scrolling_up",
					["<C-d>"] = "results_scrolling_down",
					["<c-o>"] = trouble.open,
				},
				n = { ["<c-o>"] = trouble.open },
			},
			layout_config = {
				vertical = { width = 0.8 },
			},
		},
		extensions = {
			undo = {
				mappings = {
					i = {
						["<cr>"] = require("telescope-undo.actions").restore,
					},
				},
			},
			repo = {
				list = {
					fd_opts = { "-E", ".local", "-E", ".cargo" },
				},
			},
		},
	})

	require("telescope").load_extension("undo")
	require("telescope").load_extension("recent-files")
	require("telescope").load_extension("repo")
end

local on_list = function(options, is_def)
	local item_set = {}
	for _, item in ipairs(options.items) do
		local key = string.format("%s:%s", item.filename, item.lnum)
		item_set[key] = item
	end
	local cur = string.format("%s:%s", vim.api.nvim_buf_get_name(0), vim.api.nvim_win_get_cursor(0)[1])
	item_set[cur] = nil
	local items = vim.tbl_values(item_set)

	if #items == 0 then
		return
	end

	vim.fn.setloclist(0, {}, "r", {
		context = options.context,
		items = items,
	})

	if #items == 1 and is_def then
		vim.cmd("lfirst")
		return
	end

	require("telescope.builtin").loclist()
end

local keys = {
	{ "<space>ol", "<cmd>Telescope<cr>", desc = "open telescope list" },
	{ "<space>ob", "<cmd>Telescope buffers<cr>", desc = "search buffer with preview" },
	{
		"<space>of",
		function()
			require("telescope.builtin").find_files({
				hidden = true,
				cwd = vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd(),
				find_command = { "rg", "--files", "--glob", "!**/.git/*" },
			})
		end,
		desc = "search files in workspace",
	},
	{ "<space>od", "<cmd>Telescope diagnostics<cr>", desc = "search diagnostics" },
	{ "<space>oN", "<cmd>Telescope help_tags<cr>", desc = "search neovim documents" },
	{ "<space>os", "<cmd>Telescope git_status<cr>", desc = "search git status" },
	{ "<space>oM", "<cmd>Telescope marks<cr>", desc = "search marks with preview" },
	{ "<space>ow", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "search words in current buffer" },
	{ "<space>or", "<cmd>Telescope resume<cr>", desc = "research" },
	{ "<space>ot", "<cmd>TodoTelescope<cr>", desc = "search todo comments" },
	{ "<space>on", "<cmd>Noice telescope<cr>", desc = "search notifications" },
	{
		"<space>oh",
		function()
			require("telescope").extensions["recent-files"].recent_files({})
		end,
		desc = "search recent files",
	},
	{
		"<space>oW",
		function()
			require("telescope.builtin").live_grep({
				hidden = true,
				cwd = vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd(),
			})
		end,
		desc = "search word in workspace",
	},
	{ "<space>ou", "<cmd>Telescope undo<cr>", desc = "search undo" },
	{
		"<space>oo",
		function()
			require("telescope.builtin").grep_string({
				search = (require("omega").get_selection() or { "" })[1],
				search_dirs = { vim.api.nvim_buf_get_name(0) },
			})
		end,
		desc = "search cursor word in buffer",
		mode = { "x", "n" },
	},
	{
		"<space>oO",
		function()
			require("telescope.builtin").grep_string({
				search = (require("omega").get_selection() or { "" })[1],
				cwd = vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd(),
			})
		end,
		desc = "search cursor word in workspace",
		mode = { "x", "n" },
	},
	{ "<space>oP", "<cmd>Telescope repo list<cr>", desc = "search projects" },
	{
		"<space>op",
		function()
			require("telescope.builtin").grep_string({
				search = "QUICK_PRINT",
				cwd = vim.fs.root(0, ".root") or vim.fs.root(0, ".git") or vim.fn.getcwd(),
			})
		end,
		desc = "search quick print",
	},
	{
		"gf",
		function()
			vim.lsp.buf.references(nil, { on_list = on_list })
		end,
		desc = "goto references",
	},
	{
		"gi",
		function()
			vim.lsp.buf.implementation({ on_list = on_list })
		end,
		desc = "goto implements",
	},
	{
		"gd",
		function()
			vim.lsp.buf.definition({
				on_list = function(options)
					on_list(options, true)
				end,
			})
		end,
		desc = "goto definitions",
	},
	{
		"gc",
		function()
			require("telescope.builtin").lsp_incoming_calls()
		end,
		desc = "goto incoming calls",
	},
	{
		"gC",
		function()
			require("telescope.builtin").lsp_outgoing_calls()
		end,
		desc = "goto outgoing calls",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		"mollerhoj/telescope-recent-files.nvim",
		"cljoly/telescope-repo.nvim",
	},
}
