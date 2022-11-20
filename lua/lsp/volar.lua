local utils = require("utils")
local filetypes = { "vue" }

if utils.fn.match_str_in_file(utils.fn.root_pattern() .. "/package.json", "vue") then
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
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
	root_dir = utils.fn.root_pattern,
	init_options = {
		typescript = {
			tsdk = os.getenv("HOME")
				.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib",
		},
	},
	commands = {
		VolarRenameFile = {
			rename_file,
			description = "Rename File",
		},
	},
}

return M
