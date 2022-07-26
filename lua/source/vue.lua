local utils = require("utils")

local M = {}

local elementPlus = utils.fn.require("source/framework/element-plus")
M = utils.fn.mergeTable(elementPlus, M)
local style = utils.fn.require("source/common/style")
M = utils.fn.mergeTable(style, M)

return M
