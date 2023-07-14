package.path = "./?/init.lua;" .. package.path

require("basic")
require("plugins")
require("keymap")
require("lsp")
require("snippet")
require("source")

-- load config for workspace
local core = require("core")
local project_root = core.file.root_path()
local local_config_entry = project_root .. "/.nvim/init.lua"
if core.file.file_or_dir_exists(local_config_entry) then
	package.path = project_root .. "/.nvim/?.lua;" .. package.path
	package.path = project_root .. "/.nvim/?/init.lua;" .. package.path
	dofile(local_config_entry)
end
