local utils = require("utils")

utils.fn.require("toggleterm").setup({
	-- size can be a number or function which is passed the current terminal
	size = 15,
	open_mapping = "<c-z>",
	-- on_open = fun(t: Terminal), -- function to run when the terminal opens
	-- on_close = fun(t: Terminal), -- function to run when the terminal closes
	-- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
	-- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
	-- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	highlights = {},
	shade_terminals = true, -- this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
	direction = "horizontal",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	-- float_opts = {
	-- The border key is *almost* the same as 'nvim_open_win'
	-- see :h nvim_open_win for details on borders however
	-- the 'curved' border is a custom border type
	-- not natively supported but implemented in this plugin.
	-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
	-- width = <value>,
	-- height = <value>,
	-- winblend = 3,
	-- }
})
