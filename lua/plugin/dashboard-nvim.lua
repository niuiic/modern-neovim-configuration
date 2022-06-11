local utils = require("utils")
local db = utils.fn.require("dashboard")

db.custom_header = {
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

db.custom_footer = {}

db.custom_center = {
	{
		icon = "  ",
		desc = "Projects              ",
		shortcut = "",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Recently files        ",
		shortcut = "",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "Edit Projects         ",
		shortcut = "",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
}
