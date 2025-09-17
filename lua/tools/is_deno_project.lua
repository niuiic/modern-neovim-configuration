return function()
	local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()

	if vim.uv.fs_stat(root_dir .. "/package.json") then
		return false
	end

	return vim.uv.fs_stat(root_dir .. "/deno.json")
		or vim.list_contains({
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
		}, vim.bo.filetype)
end
