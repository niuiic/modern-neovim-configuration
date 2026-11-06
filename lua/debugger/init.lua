local debugger_list = {
	"nlua",
	"js",
	"bun",
	"sh",
	"debugpy",
	"lldb",
	"dlv",
}

for _, value in pairs(debugger_list) do
	require("debugger/" .. value)
end
