local function trans_to_zh()
	require("translate").translate({
		get_command = function(input)
			return {
				"trans",
				"-e",
				"bing",
				"-b",
				":zh",
				input,
			}
		end,
		input = "selection",
		output = { "open_float" },
		resolve_result = function(result)
			if result.code ~= 0 then
				return nil
			end

			return string.match(result.stdout, "(.*)\n")
		end,
	})
end

local function trans_to_en()
	require("translate").translate({
		get_command = function(input)
			return {
				"trans",
				"-e",
				"bing",
				"-b",
				":en",
				input,
			}
		end,
		input = "selection",
		output = { "replace" },
		resolve_result = function(result)
			if result.code ~= 0 then
				return nil
			end

			return string.match(result.stdout, "(.*)\n")
		end,
	})
end

return {
	keys = {
		{
			"<C-t>",
			function()
				local selection = require("omega").get_selection()[1]
				if selection and string.match(selection, "[A-Za-z].+") then
					trans_to_zh()
				else
					trans_to_en()
				end
			end,
			mode = { "n", "x" },
			silent = true,
		},
	},
	branch = "dev",
}
