local utils = require("utils")

utils.fn.require("lspsaga").setup({
	debug = false,
	use_saga_diagnostic_sign = true,
	-- diagnostic sign
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "   ",
	-- code action title icon
	code_action_icon = " ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "<CR>",
		vsplit = "s",
		split = "i",
		quit = "<ESC>",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "<ESC>",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<ESC>",
		exec = "<CR>",
	},
	definition_preview_icon = "  ",
	border_style = "single",
	rename_prompt_prefix = "➤",
	rename_output_qflist = {
		enable = false,
		auto_open_qflist = false,
	},
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = false,
})

-- keymap
-- rename
utils.fn.map("n", "gr", ":Lspsaga rename<CR>", utils.var.opt)
-- code action
utils.fn.map("n", "ga", ":Lspsaga code_action<CR>", utils.var.opt)
utils.fn.map("x", "ga", ":<c-u>Lspsaga range_code_action<cr>", utils.var.opt)
-- go xx
utils.fn.map("n", "gh", ":Lspsaga signature_help<CR>", utils.var.opt)
utils.fn.map("n", "K", ":Lspsaga hover_doc<CR>", utils.var.opt)
utils.fn.map("n", "gf", ":Lspsaga lsp_finder<CR>", utils.var.opt)
utils.fn.map("n", "gj", ":Lspsaga diagnostic_jump_next<cr>", utils.var.opt)
utils.fn.map("n", "gk", ":Lspsaga diagnostic_jump_prev<cr>", utils.var.opt)
-- diagnostic
utils.fn.map("n", "gp", ":Lspsaga show_line_diagnostics<CR>", utils.var.opt)
