local get_buf_name = function(bufnr, root_path)
	return string.sub(vim.api.nvim_buf_get_name(bufnr), string.len(root_path) + 2)
end

local store_breakpoints = function(file_path)
	local core = require("niuiic-core")
	local root_path = core.file.root_path()

	local breakpoints = require("dap.breakpoints").get()
	breakpoints = core.lua.table.reduce(breakpoints, function(prev_res, cur_item)
		local buf_name = get_buf_name(cur_item.k, root_path)
		prev_res[buf_name] = cur_item.v
		return prev_res
	end, {})

	local text = vim.fn.json_encode(breakpoints)

	local file = io.open(file_path, "w+")
	if not file then
		return
	end
	file:write(text)
	file:close()
end

local restore_breakpoints = function(file_path)
	local core = require("niuiic-core")
	local root_path = core.file.root_path()

	if not core.file.file_or_dir_exists(file_path) then
		return
	end
	local file = io.open(file_path, "r")
	if not file then
		return
	end
	local text = file:read("*a")

	local breakpoints = vim.fn.json_decode(text)
	if breakpoints == nil then
		return
	end
	breakpoints = core.lua.list.reduce(vim.api.nvim_list_bufs(), function(prev_res, cur_item)
		local buf_name = get_buf_name(cur_item, root_path)
		if breakpoints[buf_name] ~= nil then
			prev_res[cur_item] = breakpoints[buf_name]
		end
		return prev_res
	end, {})

	core.lua.table.each(breakpoints, function(bufnr, breakpoint)
		core.lua.list.each(breakpoint, function(v)
			require("dap.breakpoints").set({
				condition = v.condition,
				log_message = v.logMessage,
				hit_condition = v.hitCondition,
			}, tonumber(bufnr), v.line)
		end)
	end)
end

return {
	config = function()
		require("multiple-session").setup({
			default_arg_num = 2,
			on_session_saved = function(session_dir)
				require("trailblazer").save_trailblazer_state_to_file(session_dir .. "/" .. "trailBlazer")
				store_breakpoints(session_dir .. "/breakpoints")
				require("quickfix").store_qf(session_dir .. "/quickfix")
			end,
			on_session_restored = function(session_dir)
				if require("niuiic-core").file.file_or_dir_exists(session_dir .. "/" .. "trailBlazer") then
					require("trailblazer").load_trailblazer_state_from_file(session_dir .. "/" .. "trailBlazer")
				end
				restore_breakpoints(session_dir .. "/breakpoints")
				require("quickfix").restore_qf(session_dir .. "/quickfix")
			end,
		})
	end,
	keys = {
		{ "<leader>ss", "<cmd>SaveSession<CR>", desc = "save session" },
		{ "<leader>sr", "<cmd>RestoreSession<CR>", desc = "restore session" },
		{ "<leader>sa", "<cmd>EnableAutoSaveSession<CR>", desc = "enable auto save session" },
		{ "<leader>sA", "<cmd>DisableAutoSaveSession<CR>", desc = "disable auto save session" },
		{ "<leader>sd", "<cmd>DeleteSession<CR>", desc = "delete session" },
	},
	lazy = false,
	dependencies = { "niuiic/niuiic-core.nvim" },
}
