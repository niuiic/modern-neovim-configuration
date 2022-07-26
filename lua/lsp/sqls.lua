local utils = require("utils")

-- see configuration on  https://github.com/lighttiger2505/sqls
local M = {
	cmd = { "sqls", "-config", utils.fn.root_pattern("/.sql_root") .. "/config.yml" },
}

return M
