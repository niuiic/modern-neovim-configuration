local core = require("core")

local M = {}

local common = require("snippet/common/node/js-ts")
M = core.lua.list.merge(common, M)

return M
