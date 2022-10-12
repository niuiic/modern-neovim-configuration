local utils = require("utils")

utils.fn.require("basic")
utils.fn.require("preload")
utils.fn.require("keymap")
utils.fn.require("plugins")
utils.fn.require("snippet")
utils.fn.require("source")

-- config for Workspace
local local_config = utils.fn.root_pattern() .. "/.nvim/init.lua"
if utils.fn.file_exists(local_config) then
	dofile(local_config)
end
