local utils = require("utils")

local autopairs = utils.fn.require("nvim-autopairs")
local rule = utils.fn.require("nvim-autopairs.rule")

autopairs.setup({})
autopairs.remove_rule("'")
autopairs.add_rule(rule("'", "'", "-rust"))
