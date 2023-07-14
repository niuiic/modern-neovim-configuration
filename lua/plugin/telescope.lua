local config = function()
	local telescope = require("telescope")
	local trouble = require("trouble.providers.telescope")

	telescope.setup({
		defaults = {
			layout_strategy = "vertical",
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<Esc>"] = "close",
					["<C-b>"] = "preview_scrolling_up",
					["<C-f>"] = "preview_scrolling_down",
					["<C-u>"] = "results_scrolling_up",
					["<C-d>"] = "results_scrolling_down",
					["<c-o>"] = trouble.open_with_trouble,
				},
				n = { ["<c-o>"] = trouble.open_with_trouble },
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
	{ "<space>occ", "<cmd>Telescope commands<CR>", desc = "search command" },
	{ "<space>och", "<cmd>Telescope command_history<CR>", desc = "search command history" },
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
	{ "<space>oN", "<cmd>Telescope help_tags<CR>", desc = "search neovim documents" },
	{ "<space>os", "<cmd>Telescope git_status<CR>", desc = "search git status" },
	{ "<space>oM", "<cmd>Telescope marks<CR>", desc = "search marks with preview" },
	{ "<space>ot", "<cmd>Telescope treesitter<CR>", desc = "search tags" },
	{ "<space>ow", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "search words in current buffer" },
	{ "<space>or", "<cmd>Telescope resume<CR>", desc = "research" },
	{ "<space>oT", "<cmd>TodoTelescope<CR>", desc = "search keywords(TODO, FIXME, etc) in the project" },
	{ "<space>on", "<cmd>Noice telescope<CR>", desc = "search notifications" },
	{ "<space>oy", "<cmd>Telescope yank_history<CR>", desc = "yank history" },
	{ "<space>oGf", "<cmd>Telescope git_files<CR>", desc = "git files" },
	{ "<space>oGs", "<cmd>Telescope git_stash<CR>", desc = "git stash" },
	{ "<space>oGt", "<cmd>Telescope git_status<CR>", desc = "git status" },
	{ "<space>oGc", "<cmd>Telescope git_bcommits<CR>", desc = "git buffer commits" },
	{ "<space>oGC", "<cmd>Telescope git_commits<CR>", desc = "git commits" },
	{ "<space>oGb", "<cmd>Telescope git_branches<CR>", desc = "git branches" },
	{
		"<space>ogw",
		function()
			require("telescope.builtin").live_grep({
				hidden = true,
				cwd = require("core").file.root_path(),
			})
		end,
		desc = "search words globally",
	},
	{ "<space>ou", "<cmd>Telescope undo<CR>", desc = "search undo" },
}

return {
	config = config,
	keys = keys,
	dependencies = { "nvim-lua/plenary.nvim" },
}
