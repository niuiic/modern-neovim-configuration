local core = require("core")

local M = {
	cmd = { "sqls", "-config", core.file.root_path() .. "/.nvim/db.yml" },
	root_dir = core.file.root_path,
}

return M
