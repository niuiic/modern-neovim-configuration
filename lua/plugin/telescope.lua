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
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--glob", "!**/.git/*" },
			},
		},
		extensions = {},
	})
end

local opt = {
	hidden = true,
}

local keys = {
	{ "<space>ol", "<cmd>Telescope<CR>", desc = "open telescope list" },
	{ "<space>ob", "<cmd>Telescope buffers<CR>", desc = "search buffer with preview" },
	{ "<space>occ", "<cmd>Telescope commands<CR>", desc = "search command" },
	{ "<space>och", "<cmd>Telescope command_history<CR>", desc = "search command history" },
	{
		"<space>of",
		function()
			require("telescope.builtin").find_files(opt)
		end,
		desc = "search files in workspace",
	},
	{ "<space>oN", "<cmd>Telescope help_tags<CR>", desc = "search neovim documents" },
	{ "<space>oh", "<cmd>Telescope oldfiles<CR>", desc = "search history files" },
	{ "<space>os", "<cmd>Telescope git_status<CR>", desc = "search git status" },
	{ "<space>oM", "<cmd>Telescope marks<CR>", desc = "search marks with preview" },
	{ "<space>ot", "<cmd>Telescope treesitter<CR>", desc = "search tags" },
	{ "<space>ow", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "search words in current buffer" },
	{ "<space>or", "<cmd>Telescope resume<CR>", desc = "research" },
	{ "<space>oT", "<cmd>TodoTelescope<CR>", desc = "search keywords(TODO, FIXME, etc) in the project" },
	{ "<space>on", "<cmd>Noice telescope<CR>", desc = "search notifications" },
	{ "<space>oy", "<cmd>Telescope yank_history<CR>", desc = "yank history" },
	{
		"<space>ogw",
		function()
			require("telescope.builtin").live_grep(opt)
		end,
		desc = "search words globally",
	},
	{
		"<space>ogt",
		function()
			vim.fn.systemlist("ctags -R")
			require("telescope.builtin").tags(opt)
		end,
		desc = "search tags globally",
	},
	{
		"gf",
		function()
			require("telescope.builtin").lsp_references()
		end,
		desc = "find lsp_references",
	},
	{
		"gm",
		function()
			require("telescope.builtin").lsp_implementations()
		end,
		desc = "find lsp_implementations",
	},
	{
		"gd",
		function()
			require("telescope.builtin").lsp_definitions()
		end,
		desc = "find lsp_definitions",
	},
	{
		"gD",
		function()
			require("telescope.builtin").lsp_type_definitions()
		end,
		desc = "find lsp_type_definitions",
	},
	{
		"gs",
		function()
			require("telescope.builtin").lsp_document_symbols()
		end,
		desc = "find lsp_document_symbols",
	},
	{
		"gS",
		function()
			require("telescope.builtin").lsp_workspace_symbols()
		end,
		desc = "find lsp_workspace_symbols",
	},
	{
		"J",
		function()
			vim.lsp.buf.hover()
		end,
	},
	{
		"D",
		function()
			vim.diagnostic.open_float()
		end,
	},
	{
		"gj",
		function()
			vim.diagnostic.goto_next({ float = false })
		end,
		desc = "jump to next diagnostic",
	},
	{
		"gJ",
		function()
			vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, float = false })
		end,
		desc = "jump to next error",
	},
	{
		"gk",
		function()
			vim.diagnostic.goto_prev({ float = false })
		end,
		desc = "jump to previous diagnostic",
	},
	{
		"gK",
		function()
			vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR, float = false })
		end,
		desc = "jump to previous error",
	},
}

return {
	config = config,
	keys = keys,
	dependencies = { "nvim-lua/plenary.nvim" },
}
