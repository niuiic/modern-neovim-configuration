local utils = require("utils")

local filetypes = {
	"javascript",
	"javascriptreact",
	"javascript.jsx",
	"typescript",
	"typescriptreact",
	"typescript.tsx",
}

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "none" }
end

local function rename_file()
	local source_file = vim.api.nvim_buf_get_name(0)
	local target_file = ""

	vim.ui.input({
		prompt = "Target : ",
		completion = "file",
		default = source_file,
	}, function(input)
		target_file = input
	end)

	-- return if input is canceled
	if target_file == "" then
		return
	end

	local params = {
		command = "_typescript.applyRenameFile",
		arguments = {
			{
				sourceUri = source_file,
				targetUri = target_file,
			},
		},
	}

	vim.lsp.util.rename(source_file, target_file)
	vim.api.nvim_command("e")
	vim.lsp.buf.execute_command(params)
end

local M = {
	filetypes = filetypes,
	init_options = {
		hostInfo = "neovim",
	},
	commands = {
		TsserverRenameFile = {
			rename_file,
			description = "Rename File",
		},
	},
	root_dir = utils.fn.root_pattern,
}

return M
