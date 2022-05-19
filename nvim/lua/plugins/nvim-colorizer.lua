local status, colorizer = pcall(require, "colorizer")
if not status then
	vim.notify("not found nvim-colorizer.lua")
	return
end

local options = {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	names = true, -- "Name" codes like Blue
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode = "background", -- Set the display mode.
}

colorizer.setup({
	"*",
	css = options,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_command("ColorizerAttachToBuffer")
	end,
})
