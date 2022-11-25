-- translate-shell, xclip is required

local plenary = require("plenary")
local utils = require("utils")

local proxy = "http://127.0.0.1:10025"

local function trans(word, target)
	plenary.job
		:new({
			command = "trans",
			args = { "-b", "-e", "google", "-t", target, "-x", proxy, word },
			on_exit = function(res)
				local result = res:result()[1]
				if result == nil or result == "" then
					vim.notify("translate failed", "error")
				else
					vim.notify(result, "success")
				end
			end,
		})
		:start()
end

vim.api.nvim_create_user_command("TransToZH", function()
	local text = utils.get_visual_selection()
	trans(text, "zh-CN")
end, {
	range = 0,
})

vim.api.nvim_create_user_command("TransToEN", function()
	local source
	vim.ui.input({
		prompt = "Target : ",
		completion = "file",
	}, function(input)
		if input ~= nil then
			source = input
		end
	end)

	-- return if input is canceled
	if source == "" then
		return
	end

	trans(source, "en")
end, {})

utils.fn.whichKeyMap({
	t = {
		name = "trouble",
		t = {
			":<c-u>TransToZH<CR>",
			"trans to zh-CN",
		},
		T = {
			"<cmd>TransToEN<CR>",
			"trans to en",
		},
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})
