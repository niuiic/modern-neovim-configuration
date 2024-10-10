local core = require("core")

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

return {
	root_dir = core.file.root_path,
}
