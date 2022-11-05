package.path = debug.getinfo(1, "S").source:match([[^@?(.*[\/])[^\/]-$]]) .. "?.lua;" .. package.path
package.path = debug.getinfo(1, "S").source:match([[^@?(.*[\/])[^\/]-$]]) .. "?/init.lua;" .. package.path

local divider = require("divider")
local ui = require("ui")

local config = {
	dividers = {
		{ pattern = [[%%=+ [\s\S]+ =+%%]], hl = "#ff00ff" },
		{ pattern = [[%%-+ [\s\S]+ -+%%]], hl = "#ffff00" },
		{ pattern = [[%% [\s\S]+ %%]], hl = "#00ff7c" },
	},
}

local pattern_group = {}

local function setup(new_config)
	if new_config == nil then
		new_config = config
	end
	local hl_group = {}
	for _, value in ipairs(new_config.dividers) do
		table.insert(pattern_group, value.pattern)
		table.insert(hl_group, value.hl)
	end
	ui.create_hl_group(hl_group)
end

setup()

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	pattern = { "*" },
	callback = function()
		divider.divide(pattern_group)
	end,
})
