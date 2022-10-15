local utils = require("utils")

local script_list = {
	"divider",
}

for _, value in ipairs(script_list) do
	utils.fn.require("script/" .. value)
end
