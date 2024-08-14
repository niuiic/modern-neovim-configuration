local core = require("core")

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

vim.api.nvim_create_user_command("DenolsRename", function()
	vim.lsp.buf.rename(nil, {
		name = "denols",
	})
end, {})

return {
	root_dir = core.file.root_path,
}
