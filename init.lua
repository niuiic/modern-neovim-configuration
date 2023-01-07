local utils = require("utils")

package.path = "./?/init.lua;" .. package.path

require("basic")
require("plugins")
require("keymap")
require("lsp")
require("snippet")
require("source")
require("script")

-- load config for Workspace
local project_root = utils.fn.root_pattern()
local local_config_entry = project_root .. "/.nvim/init.lua"
if utils.fn.file_or_dir_exists(local_config_entry) then
	package.path = project_root .. "/.nvim/?.lua;" .. package.path
	package.path = project_root .. "/.nvim/?/init.lua;" .. package.path
	dofile(local_config_entry)
end
