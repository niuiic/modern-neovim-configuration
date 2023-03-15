local core = require("niuiic-core")

-- see configuration on  https://github.com/lighttiger2505/sqls
local M = {
	cmd = { "sqls", "-config", core.file.root_path(".sql_root") .. "/config.yml" },
}

return M
