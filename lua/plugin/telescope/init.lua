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
			require("plugin.telescope.file").search_file_in_workspace()
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
		"<space>oW",
		function()
			require("plugin.telescope.word").search_word_in_workspace()
		end,
		desc = "search word in workspace",
	},
	{ "<space>ou", "<cmd>Telescope undo<cr>", desc = "search undo" },
	{
		"<space>oo",
		function()
			require("plugin.telescope.word").search_cursor_word_in_buffer()
		end,
		desc = "search cursor word in buffer",
		mode = { "x", "n" },
	},
	{
		"<space>oO",
		function()
			require("plugin.telescope.word").search_cursor_word_in_workspace()
		end,
		desc = "search cursor word in workspace",
		mode = { "x", "n" },
	},
	{
		"<space>op",
		function()
			require("telescope.builtin").grep_string({
				search = "QUICK_PRINT",
				cwd = vim.fs.root(0, ".git") or vim.fn.getcwd(),
			})
		end,
		desc = "search quick print",
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
	dependencies = { "nvim-lua/plenary.nvim" },
}
