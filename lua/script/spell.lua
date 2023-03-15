-- translate-shell is required

local plenary = require("plenary")
local core = require("niuiic-core")

local function spell_check(word)
	plenary.job
		:new({
			command = "trans",
			args = { "-e", "spell", word },
			on_exit = function(res)
				local original_res = res:result()[1]
				local final_res = string.match(original_res, "(%[[a-zA-Z|]+])")
				if final_res == nil then
					vim.notify("no spell errors", vim.log.levels.INFO)
				else
					vim.notify(final_res, vim.log.levels.ERROR)
				end
			end,
		})
		:sync()
end

vim.api.nvim_create_user_command("SpellCheck", function()
	local text = core.text.selection()
	if string.match(text, "(%A+)") ~= nil then
		vim.notify("unsupported language", vim.log.levels.ERROR)
	else
		spell_check(text)
	end
end, {
	range = 0,
})

require("which-key").register({
	c = {
		":<c-u>SpellCheck<CR>",
		"spell check",
	},
}, {
	mode = "v",
	prefix = "<localleader>",
})
