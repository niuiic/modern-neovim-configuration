local utils = require("utils")

local M = {
	modify_capabilities = function(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		return capabilities
	end,
	on_attach = function(client, _)
		if vim.bo.filetype == "vue" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	filetypes = { "css", "scss", "less", "vue" },
	root_dir = utils.fn.root_pattern,
}

vim.api.nvim_create_user_command("AS", function()
	local res = vim.lsp.get_active_clients()
	for _, value in pairs(res) do
		if value.name == "cssls" then
			utils.fn.log(vim.inspect(value))
		end
	end
end, {})

return M
