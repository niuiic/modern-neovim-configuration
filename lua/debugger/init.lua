local debugger_list = {
	"nlua",
	"js",
	"bun",
	"sh",
	"debugpy",
	"lldb",
}

for _, value in pairs(debugger_list) do
	require("debugger/" .. value)
end
