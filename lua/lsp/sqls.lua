local utils = require("utils")

-- see configuration on  https://github.com/lighttiger2505/sqls
local config = {
    cmd = { "sqls", "-config", utils.fn.getRootPath("/.sql_root") .. "/config.yml" },
}

return config
