-- translate-shell is required

local plenary = require("plenary")
local utils = require("utils")

local function spell_check(word)
	plenary.job
		:new({
			command = "trans",
			args = { "-e", "spell", word },
			on_exit = function(res)
				local original_res = res:result()[1]
				local final_res = string.match(original_res, "(%[[a-zA-Z|]+])")
				if final_res == nil then
					vim.notify("no spell errors", "success")
				else
					vim.notify(final_res, "error")
				end
			end,
		})
		:sync()
end

vim.api.nvim_create_user_command("SpellCheck", function()
	local text = utils.fn.get_visual_selection()
	if string.match(text, "(%A+)") ~= nil then
		vim.notify("unsupported language", "error")
	else
		spell_check(text)
	end
end, {
	range = 0,
})

utils.fn.require("which-key").register({
	c = {
		":<c-u>SpellCheck<CR>",
		"spell check",
	},
}, {
	mode = "v",
	prefix = "<localleader>",
})
