require("task").register_task({
	name = "expand_branches",
	run = function(context)
		local bufnr = vim.api.nvim_get_current_buf()
		local selection = context.selection
		local selected_area = context.selected_area

		require("omega").to_normal_mode()
		if not selection then
			return
		end

		local topics = {}
		local branches = {}
		local cur_topic

		for _, line in ipairs(selection) do
			local topic = line:match("^%- (.*)$")
			if topic then
				branches[topic] = {}
				table.insert(topics, topic)
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
		for _, topic in ipairs(topics) do
			local results = {}

			local branch_list = branches[topic]
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

		local results = {}
		for _, result in ipairs(prev_results) do
			if #results == 0 then
				table.insert(results, result)
			else
				for i, x in ipairs(results) do
					if result <= x then
						table.insert(results, i, result)
						goto continue
					end
				end
				table.insert(results, result)
				::continue::
			end
		end
		table.insert(results, 1, "")

		vim.api.nvim_buf_set_lines(bufnr, selected_area.end_lnum, selected_area.end_lnum, false, results)
	end,
	is_enabled = function()
		return vim.bo.filetype == "markdown"
	end,
})
