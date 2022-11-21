local utils = require("utils")

local commands = {
	"RenameFile",
	"OrganizeImports",
}

local function rename_command(old_prefix)
	for _, command in ipairs(commands) do
		vim.api.nvim_create_user_command("LSP" .. command, function()
			vim.api.nvim_command(old_prefix .. command)
		end, {})
	end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = "*",
	callback = function()
		local root_path = utils.fn.root_pattern() .. "/"
		if
			utils.fn.file_exists(root_path .. "package.json")
			and utils.fn.match_str_in_file(root_path .. "package.json", "vue")
		then
			rename_command("Volar")
		elseif utils.fn.file_exists(root_path .. "package.json") then
			rename_command("Tsserver")
		end
	end,
})
