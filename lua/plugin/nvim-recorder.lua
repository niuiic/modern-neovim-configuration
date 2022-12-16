local utils = require("utils")

utils.fn.require("recorder").setup({
	mapping = {
		startStopRecording = "r",
		playMacro = "R",
		editMacro = "cr",
		switchSlot = "<A-r>",
	},
})
