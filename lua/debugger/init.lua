local debuggers = {
	"dlv",
	"chrome",
	"lldb-vscode",
	"nlua",
	"node",
	"sh",
}

for _, value in pairs(debuggers) do
	require("debugger/" .. value)
end
