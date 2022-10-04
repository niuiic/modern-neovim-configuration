local utils = require("utils")

vim.g.asyncrun_rootmarks = { ".git" }
vim.g.asynctasks_term_pos = "bottom"
vim.g.asynctasks_term_rows = 10
vim.g.asynctasks_term_cols = 80
vim.g.asynctasks_term_focus = 0
vim.g.asynctasks_confirm = 0
vim.g.asynctasks_config_name = ".task.ini"
vim.g.asyncrun_open = 25

-- keymap
-- utils.fn.whichKeyMap({
-- 	s = {
-- 		name = "async tasks",
-- 		r = {
-- 			"<cmd>AsyncTask project-run<CR>",
-- 			"run project",
-- 		},
-- 		b = {
-- 			"<cmd>AsyncTask project-build<CR>",
-- 			"build project",
-- 		},
-- 		t = {
-- 			"<cmd>AsyncTask project-test<CR>",
-- 			"test project",
-- 		},
-- 		d = {
-- 			"<cmd>AsyncTask project-debug<CR>",
-- 			"debug project",
-- 		},
-- 		R = {
-- 			"<cmd>AsyncTask project-concrete-run<CR>",
-- 			"run project (concrete)",
-- 		},
-- 		B = {
-- 			"<cmd>AsyncTask project-concrete-build<CR>",
-- 			"build project (concrete)",
-- 		},
-- 		T = {
-- 			"<cmd>AsyncTask project-concrete-test<CR>",
-- 			"test project (concrete)",
-- 		},
-- 		D = {
-- 			"<cmd>AsyncTask project-concrete-debug<CR>",
-- 			"debug project (concrete)",
-- 		},
-- 		c = {
-- 			"<cmd>AsyncTask project-clean<CR>",
-- 			"clean project",
-- 		},
-- 		f = {
-- 			"<cmd>AsyncTask trans-to-en<CR>",
-- 			"translate chinese to english",
-- 		},
-- 		s = {
-- 			"<cmd>AsyncTask sql<CR>",
-- 			"run sql command",
-- 		},
-- 		e = {
-- 			"<cmd>AsyncTaskEdit<CR>",
-- 			"edit config",
-- 		},
-- 		E = {
-- 			"<cmd>AsyncTaskEdit!<CR>",
-- 			"edit global config",
-- 		},
-- 	},
-- }, {
-- 	mode = "n",
-- 	prefix = "<localleader>",
-- })
