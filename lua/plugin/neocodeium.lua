return {
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup({
			show_label = false,
			silent = true,
		})
		vim.keymap.set("i", "<tab>", neocodeium.accept)
	end,
}
