-- translate-shell is required

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
					vim.notify("translate failed", vim.log.levels.ERROR, {
						title = "Translate",
					})
				else
					vim.notify(result, vim.log.levels.INFO, {
						title = "Translate",
					})
				end
				if target == "en" then
					vim.schedule(function()
						vim.fn.setreg("+", result)
					end)
				end
			end,
		})
		:start()
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
		prompt = "zh-CN: ",
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

require("which-key").register({
	T = {
		"<cmd>TransToEN<CR>",
		"trans to en",
	},
}, {
	mode = "n",
	prefix = "<localleader>",
})

vim.keymap.set("v", "<C-t>", ":<c-u>TransToZH<CR>", { silent = true })
