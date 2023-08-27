local debugger_list = {
	"dlv",
	"lldb-vscode",
	"nlua",
	"js",
	"sh",
}

for _, value in pairs(debugger_list) do
	require("debugger/" .. value)
end
