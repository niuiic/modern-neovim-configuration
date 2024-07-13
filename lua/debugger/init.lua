local debugger_list = {
	"nlua",
	"js",
	"sh",
	"codelldb",
	"debugpy",
}

for _, value in pairs(debugger_list) do
	require("debugger/" .. value)
end
