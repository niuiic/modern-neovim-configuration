local debugger_list = {
	"nlua",
	"js",
	"sh",
	"codelldb",
	"dart",
}

for _, value in pairs(debugger_list) do
	require("debugger/" .. value)
end
