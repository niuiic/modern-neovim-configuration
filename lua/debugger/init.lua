local debugger_list = {
	"lldb-vscode",
	"nlua",
	"js",
	"sh",
	"codelldb",
}

for _, value in pairs(debugger_list) do
	require("debugger/" .. value)
end
