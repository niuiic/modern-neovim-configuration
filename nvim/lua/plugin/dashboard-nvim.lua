vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "" }
vim.g.dashboard_custom_section = {
	a = { description = { "  Projects              " }, command = "Telescope projects" },
	b = { description = { "  Recently files        " }, command = "Telescope oldfiles" },
	c = { description = { "  Edit keybindings      " }, command = "edit ~/.config/nvim/lua/keybindings.lua" },
	d = {
		description = { "  Edit Projects         " },
		command = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
}

vim.g.dashboard_custom_header = {
	[[                                                                   ]],
	[[                                                                   ]],
	[[                                                             ____  ]],
	[[                                            ,--,           ,'  , `.]],
	[[      ,---,              ,---.            ,--.'|        ,-+-,.' _ |]],
	[[  ,-+-. /  |            '   ,'\      .---.|  |,      ,-+-. ;   , ||]],
	[[ ,--.'|'   |   ,---.   /   /   |   /.  ./|`--'_     ,--.'|'   |  ||]],
	[[|   |  ,"' |  /     \ .   ; ,. : .-' . ' |,' ,'|   |   |  ,', |  |,]],
	[[|   | /  | | /    /  |'   | |: :/___/ \: |'  | |   |   | /  | |--' ]],
	[[|   | |  | |.    ' / |'   | .; :.   \  ' .|  | :   |   : |  | ,    ]],
	[[|   | |  |/ '   ;   /||   :    | \   \   ''  : |__ |   : |  |/     ]],
	[[|   | |--'  '   |  / | \   \  /   \   \   |  | '.'||   | |`-'      ]],
	[[|   |/      |   :    |  `----'     \   \ |;  :    ;|   ;/          ]],
	[['---'        \   \  /               '---" |  ,   / '---'           ]],
	[[              `----'                       ---`-'                  ]],
	[[                                                                   ]],
	[[                                                                   ]],
}
