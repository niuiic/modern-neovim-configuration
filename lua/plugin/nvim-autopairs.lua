local utils = require("utils")

local autopairs = utils.fn.require("nvim-autopairs")
local rule = utils.fn.require("nvim-autopairs.rule")

autopairs.add_rules(rule("'", "'", "-rust"))
autopairs.setup({})
