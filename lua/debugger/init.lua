local debuggers = {
	"dlv",
	"lldb-vscode",
	"nlua",
	"js",
	"sh",
}

for _, value in pairs(debuggers) do
	require("debugger/" .. value)
end
