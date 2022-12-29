local utils = require("utils")

require("recorder").setup({
	mapping = {
		startStopRecording = "r",
		playMacro = "R",
		editMacro = "cr",
		switchSlot = "<A-r>",
	},
})
