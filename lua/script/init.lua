local utils = require("utils")

local script_list = {
	"divider",
	"quickfix",
	"spell",
	"translate",
	"filetype",
}

for _, value in ipairs(script_list) do
	require("script/" .. value)
end
