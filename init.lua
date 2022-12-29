local utils = require("utils")

package.path = "./?/init.lua;" .. package.path

require("plugins")
require("basic")
require("keymap")
require("snippet")
require("source")
require("script")

-- config for Workspace
local local_config = utils.fn.root_pattern() .. "/.nvim/init.lua"
if utils.fn.file_exists(local_config) then
	dofile(local_config)
end
