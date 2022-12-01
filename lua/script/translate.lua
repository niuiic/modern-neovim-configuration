-- translate-shell, xclip is required

local plenary = require("plenary")
local utils = require("utils")

local proxy = "http://127.0.0.1:10025"

local function trans(word, target)
	local result

	plenary.job
		:new({
			command = "trans",
			args = { "-b", "-e", "google", "-t", target, "-x", proxy, word },
			on_exit = function(res)
				result = res:result()[1]
				if result == nil or result == "" then
					vim.notify("translate failed", "error")
				else
					vim.notify(result, "success")
				end
			end,
		})
		:sync()

	if target == "en" then
		vim.api.nvim_command("!echo " .. result .. " | xclip -sel clip")
	end
end

vim.api.nvim_create_user_command("TransToZH", function()
	local text = utils.fn.get_visual_selection()
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
	if source == nil then
		return
	end

	trans(source, "en")
end, {})

utils.fn.whichKeyMap({
	T = {
		"<cmd>TransToEN<CR>",
		"trans to en",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

utils.fn.map("v", "<C-t>", ":<c-u>TransToZH<CR>", utils.var.opt)
