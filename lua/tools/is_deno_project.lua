return function()
	local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
	return vim.uv.fs_stat(root_dir .. "/deno.json")
		or (
			not vim.uv.fs_stat(root_dir .. "/package.json")
			and vim.list_contains({
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
			}, vim.bo.filetype)
		)
end
