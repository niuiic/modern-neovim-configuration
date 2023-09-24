return {
	config = function()
		local colors = { "#0099ff", "#00ff00", "#ff4dc3", "#9ffc00", "#1cffe9", "#ff9933" }
		for i, color in ipairs(colors) do
			vim.api.nvim_set_hl(0, "RainbowColor" .. i, { fg = color })
		end
		require("rainbow-delimiters.setup")({
			highlight = {
				"RainbowColor1",
				"RainbowColor2",
				"RainbowColor3",
				"RainbowColor4",
				"RainbowColor5",
				"RainbowColor6",
			},
		})
	end,
}
