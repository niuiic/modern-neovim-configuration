local function fix_all()
	local bufnr = vim.api.nvim_get_current_buf()
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = "stylelint_lsp" })[1]
	if client == nil then
		return
	end

	client:request_sync("workspace/executeCommand", {
		command = "stylelint.applyAutoFixes",
		arguments = {
			{
				uri = vim.uri_from_bufnr(bufnr),
				version = vim.lsp.util.buf_versions[bufnr],
			},
		},
	}, nil, bufnr)
end

local function is_enabled()
	if not require("tools.lsp_valid")("stylelint_lsp") then
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

require("lsp-commands").register_command({
	name = "stylelint_lsp/fix all",
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
