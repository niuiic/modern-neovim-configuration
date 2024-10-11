local fix_all = function()
	local util = require("lspconfig.util")
	local opts = { sync = true, bufnr = 0 }
	local bufnr = util.validate_bufnr(opts.bufnr or 0)

	local stylelint_lsp_client = util.get_active_client_by_name(bufnr, "stylelint_lsp")
	if stylelint_lsp_client == nil then
		return
	end

	local request
	if opts.sync then
		request = function(buf, method, params)
			stylelint_lsp_client.request_sync(method, params, nil, buf)
		end
	else
		request = function(buf, method, params)
			stylelint_lsp_client.request(method, params, nil, buf)
		end
	end

	request(bufnr, "workspace/executeCommand", {
		command = "stylelint.applyAutoFixes",
		arguments = {
			{
				uri = vim.uri_from_bufnr(bufnr),
				version = vim.lsp.util.buf_versions[bufnr],
			},
		},
	})
end

local M = {
	settings = {},
	filetypes = {
		"css",
		"less",
		"scss",
		"sugarss",
		"vue",
		"wxss",
		"javascriptreact",
		"typescriptreact",
	},
	commands = {
		StylelintFixAll = {
			fix_all,
			description = "Fix all problems",
		},
	},
}

return M
