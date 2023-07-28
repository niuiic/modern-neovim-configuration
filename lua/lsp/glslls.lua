local core = require("core")

local M = {
	cmd = { "glslls", "--stdin", "--target-env=opengl" },
	root_dir = core.file.root_path,
}

return M
