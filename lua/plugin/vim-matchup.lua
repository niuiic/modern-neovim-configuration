return {
	config = function()
		vim.keymap.set("n", "mk", "<plug>(matchup-[%)", { silent = true })
		vim.keymap.set("n", "mj", "<plug>(matchup-z%)", { silent = true })
	end,
}
