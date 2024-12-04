return function()
	local bufnr = vim.api.nvim_get_current_buf()
	local area = require("omega").get_selected_area()
	local lines = require("omega").get_selection()
	require("omega").to_normal_mode()
	if not lines then
		return
	end

	local branches = {}
	local cur_topic

	for _, line in ipairs(lines) do
		local topic = line:match("^%- (.*)$")
		if topic then
			branches[topic] = {}
			cur_topic = topic
		else
			local branch = line:match("^  %- (.*)$")
			if branch then
				table.insert(branches[cur_topic], branch)
			end
		end
	end
	if vim.tbl_isempty(branches) then
		return
	end

	local prev_results = {}
	for topic, branch_list in pairs(branches) do
		local results = {}

		for _, branch in ipairs(branch_list) do
			if #prev_results == 0 then
				table.insert(results, string.format("- %s: %s", topic, branch))
			else
				for _, prev_result in ipairs(prev_results) do
					table.insert(results, string.format("%s; %s: %s", prev_result, topic, branch))
				end
			end
		end

		prev_results = results
	end

	table.insert(prev_results, 1, "")

	vim.api.nvim_buf_set_lines(bufnr, area.end_lnum, area.end_lnum, false, prev_results)
end
