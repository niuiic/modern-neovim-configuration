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
	local text = utils.get_visual_selection()
	trans(text, "en")
end, {
	range = 0,
})

utils.fn.map("v", "<C-t>", ":<c-u>TransToZH<CR>", utils.var.opt)
utils.fn.map("v", "<A-t>", ":<c-u>TransToEN<CR>", utils.var.opt)
