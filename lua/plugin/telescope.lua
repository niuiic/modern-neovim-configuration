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
						["<cr>"] = require("telescope-undo.actions").restore,
					},
				},
			},
		},
	})

	require("telescope").load_extension("undo")
end

local keys = {
	{ "<space>ol", "<cmd>Telescope<cr>", desc = "open telescope list" },
	{ "<space>ob", "<cmd>Telescope buffers<cr>", desc = "search buffer with preview" },
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
	{ "<space>od", "<cmd>Telescope diagnostics<cr>", desc = "search diagnostics" },
	{ "<space>oN", "<cmd>Telescope help_tags<cr>", desc = "search neovim documents" },
	{ "<space>os", "<cmd>Telescope git_status<cr>", desc = "search git status" },
	{ "<space>oM", "<cmd>Telescope marks<cr>", desc = "search marks with preview" },
	{ "<space>ot", "<cmd>Telescope treesitter<cr>", desc = "search tags" },
	{ "<space>ow", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "search words in current buffer" },
	{ "<space>or", "<cmd>Telescope resume<cr>", desc = "research" },
	{ "<space>oT", "<cmd>TodoTelescope<cr>", desc = "search keywords(TODO, FIXME, etc) in the project" },
	{ "<space>on", "<cmd>Noice telescope<cr>", desc = "search notifications" },
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
	{ "<space>ou", "<cmd>Telescope undo<cr>", desc = "search undo" },
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
