package.path = "./?/init.lua;" .. package.path

require("basic")
require("plugins")
require("keymap")
require("lsp")
require("snippet")

-- load config for workspace
local root_dir = vim.fs.root(0, ".git") or vim.fn.getcwd()
local local_config_entry = root_dir .. "/.nvim/init.lua"
if require("omega").exist(local_config_entry) then
	package.path = root_dir .. "/.nvim/?.lua;" .. package.path
	package.path = root_dir .. "/.nvim/?/init.lua;" .. package.path
	dofile(local_config_entry)
end
