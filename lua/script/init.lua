local script_list = {
	"quickfix",
}

for _, value in ipairs(script_list) do
	require("script/" .. value)
end
