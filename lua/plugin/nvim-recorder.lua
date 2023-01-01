return {
	config = function()
		require("recorder").setup({
			mapping = {
				startStopRecording = "r",
				playMacro = "R",
				editMacro = "cr",
				switchSlot = "<A-r>",
			},
		})
	end,
	keys = { "r" },
}
