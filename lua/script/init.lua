local script_list = {
	"quickfix",
	"spell",
	"translate",
	"filetype",
}

for _, value in ipairs(script_list) do
	require("script/" .. value)
end
