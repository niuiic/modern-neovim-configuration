local function fix_all()
	local util = require("lspconfig.util")
	local opts = { sync = true, bufnr = 0 }
	local bufnr = util.validate_bufnr(opts.bufnr or 0)

	local stylelint_lsp_client = vim.lsp.get_clients({ name = "stylelint_lsp" })[1]
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

local function is_enabled()
	if not (#vim.lsp.get_clients({
		name = "stylelint_lsp",
	}) > 0) then
		return false
	end

	if vim.bo.filetype == "vue" then
		local node = vim.treesitter.get_node()
		while node do
			if string.find(node:sexpr(), "(style_element", 1, true) == 1 then
				return true
			end

			node = node:parent()
		end

		return false
	end

	return true
end

require("lsp-commands").register_command("fix all", {
	name = "stylelint_lsp",
	run = fix_all,
	is_enabled = is_enabled,
})

return {
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
}
