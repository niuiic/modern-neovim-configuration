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
					["<Esc>"] = "close",
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
						["<CR>"] = require("telescope-undo.actions").restore,
					},
				},
			},
		},
	})

	require("telescope").load_extension("undo")
end

local keys = {
	{ "<space>ol", "<cmd>Telescope<CR>", desc = "open telescope list" },
	{ "<space>ob", "<cmd>Telescope buffers<CR>", desc = "search buffer with preview" },
	{
		"<space>of",
		function()
			require("telescope.builtin").find_files({
				hidden = true,
				cwd = require("core").file.root_path(),
				find_command = { "rg", "--files", "--glob", "!**/.git/*" },
			})
		end,
		desc = "search files in workspace",
	},
	{ "<space>od", "<cmd>Telescope diagnostics<CR>", desc = "search diagnostics" },
	{ "<space>oN", "<cmd>Telescope help_tags<CR>", desc = "search neovim documents" },
	{ "<space>os", "<cmd>Telescope git_status<CR>", desc = "search git status" },
	{ "<space>oM", "<cmd>Telescope marks<CR>", desc = "search marks with preview" },
	{ "<space>ot", "<cmd>Telescope treesitter<CR>", desc = "search tags" },
	{ "<space>ow", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "search words in current buffer" },
	{ "<space>or", "<cmd>Telescope resume<CR>", desc = "research" },
	{ "<space>oT", "<cmd>TodoTelescope<CR>", desc = "search keywords(TODO, FIXME, etc) in the project" },
	{ "<space>on", "<cmd>Noice telescope<CR>", desc = "search notifications" },
	{
		"<space>oW",
		function()
			require("telescope.builtin").live_grep({
				hidden = true,
				cwd = require("core").file.root_path(),
			})
		end,
		desc = "search words globally",
	},
	{ "<space>ou", "<cmd>Telescope undo<CR>", desc = "search undo" },
	{
		"<space>oo",
		function()
			require("telescope.builtin").grep_string({
				search = require("core").text.selection(),
				search_dirs = { vim.api.nvim_buf_get_name(0) },
			})
		end,
		desc = "search current word in buffer",
		mode = { "v", "n" },
	},
	{
		"<space>oO",
		function()
			require("telescope.builtin").grep_string({
				search = require("core").text.selection(),
				cwd = require("core").file.root_path(),
			})
		end,
		desc = "search current word in workspace",
		mode = { "v", "n" },
	},
}

return {
	config = config,
	keys = keys,
	dependencies = { "nvim-lua/plenary.nvim" },
}
