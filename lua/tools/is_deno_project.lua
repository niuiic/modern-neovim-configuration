return function()
	local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
	return not vim.uv.fs_stat(root_dir .. "/package.json")
		or vim.uv.fs_stat(root_dir .. "/deno.json")
		or vim.uv.fs_stat(root_dir .. "/deno.lock")
end
