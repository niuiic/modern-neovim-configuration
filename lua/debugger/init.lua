local utils = require("utils")

local debuggers = {
	"dlv",
	"chrome",
	"lldb-vscode",
	"node-debug2",
	"nlua",
}

for _, value in pairs(debuggers) do
	utils.fn.require("debugger/" .. value)
end
