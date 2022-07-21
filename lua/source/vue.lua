local utils = require("utils")

local M = {}

local elementPlus = utils.fn.require("source/framework/element-plus")
M = utils.fn.mergeTable(elementPlus, M)

return M
