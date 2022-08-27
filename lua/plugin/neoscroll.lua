local utils = require("utils")

utils.fn.require("neoscroll").setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = { "<C-u>", "<C-d>", "zt", "zz", "zb" },
})

local t = {}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
t["zt"] = { "zt", { "250" } }
t["zz"] = { "zz", { "250" } }
t["zb"] = { "zb", { "250" } }

utils.fn.require("neoscroll.config").set_mappings(t)
