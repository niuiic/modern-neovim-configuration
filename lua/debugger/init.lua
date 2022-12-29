local utils = require("utils")

local debuggers = {
	"dlv",
	"chrome",
	"lldb-vscode",
	"nlua",
	"node",
}

for _, value in pairs(debuggers) do
	require("debugger/" .. value)
end
