local utils = require("utils")

utils.fn.require("lspsaga").init_lsp_saga({
	-- Options with default value
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "single",
	-- when cursor in saga window you config these to move
	move_in_saga = { prev = "<C-b>", next = "<C-f>" },
	-- Error, Warn, Info, Hint
	-- use emoji like
	-- { "🙀", "😿", "😾", "😺" }
	-- or
	-- { "😡", "😥", "😤", "😐" }
	-- and diagnostic_header can be a function type
	-- must return a string and when diagnostic_header
	-- is function type it will have a param `entry`
	-- entry is a table type has these filed
	-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	-- show diagnostic source
	show_diagnostic_source = true,
	-- add bracket or something with diagnostic source, just have 2 elements
	diagnostic_source_bracket = {},
	-- use emoji lightbulb in default
	code_action_icon = "💡",
	-- if true can press number to execute the codeaction in codeaction window
	code_action_num_shortcut = true,
	-- same as nvim-lightbulb but async
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = true,
	},
	-- finder icons
	finder_icons = {
		def = "  ",
		ref = "諭 ",
		link = "  ",
	},
	-- preview lines of lsp_finder and definition preview
	max_preview_lines = 10,
	finder_action_keys = {
		open = "<cr>",
		vsplit = "v",
		split = "s",
		tabe = "t",
		quit = "<esc>",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "<esc>",
		exec = "<CR>",
	},
	rename_action_quit = "<esc>",
	definition_preview_icon = "  ",
	-- show symbols in winbar must nightly
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = " ",
		show_file = true,
		click_support = false,
	},

	-- if you don't use nvim-lspconfig you must pass your server name and
	-- the related filetypes into this table
	-- like server_filetype_map = { metals = { "sbt", "scala" } }
	server_filetype_map = {},
})

-- keymap
local telescope_builtin = utils.fn.require("telescope.builtin")
utils.fn.whichKeyMap({
	g = {
		r = {
			"<cmd>Lspsaga rename<CR>",
			"lsp rename",
		},
		a = {
			":Lspsaga code_action<CR>",
			"code action",
		},
		f = {
			function()
				telescope_builtin.lsp_references()
			end,
			"find lsp_references",
		},
		m = {
			function()
				telescope_builtin.lsp_implementations()
			end,
			"find lsp_implementations",
		},
		d = {
			function()
				telescope_builtin.lsp_definitions()
			end,
			"find lsp_definitions",
		},
		D = {
			function()
				telescope_builtin.lsp_type_definitions()
			end,
			"find lsp_type_definitions",
		},
		s = {
			function()
				telescope_builtin.lsp_document_symbols()
			end,
			"find lsp_document_symbols",
		},
		S = {
			function()
				telescope_builtin.lsp_workspace_symbols()
			end,
			"find lsp_workspace_symbols",
		},
		h = {
			"<cmd>Lspsaga signature_help<CR>",
			"find signature_help",
		},
		j = {
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			"jump to next diagnostic ",
		},
		k = {
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			"jump to previous diagnostic ",
		},
	},
}, {
	mode = "n",
})

utils.fn.map("n", "K", ":Lspsaga hover_doc<CR>", utils.var.opt)
local action = require("lspsaga.action")
vim.keymap.set("n", "<C-f>", function()
	action.smart_scroll_with_saga(1)
end, { silent = true })
vim.keymap.set("n", "<C-b>", function()
	action.smart_scroll_with_saga(-1)
end, { silent = true })

utils.fn.whichKeyMap({
	g = {
		a = {
			"<cmd>Lspsaga range_code_action<CR>",
			"code action",
		},
	},
}, { mode = "v" })
