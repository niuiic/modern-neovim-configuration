local utils = require("utils")
local ls = utils.fn.require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local M = {
	-- for element plus ui
	s("el-col", { t({ "<el-col>", "\t" }), i(1), t({ "", "</el-col>" }) }),
	s("el-row", { t({ "<el-row>", "\t" }), i(1), t({ "", "</el-row>" }) }),
	s("el-conatiner", { t({ "<el-conatiner>" }), i(1), t({ "</el-conatiner>" }) }),
	s("el-button", { t({ "<el-button>" }), i(1), t({ "</el-button>" }) }),
	s("el-link", { t({ "<el-link>" }), i(1), t({ "</el-link>" }) }),
	s("el-radio", { t({ "<el-radio>" }), i(1), t({ "</el-radio>" }) }),
	s("el-radio-group", { t({ "<el-radio-group>" }), i(1), t({ "</el-radio-group>" }) }),
	s("el-checkbox", { t({ "<el-checkbox>" }), i(1), t({ "</el-checkbox>" }) }),
	s("el-checkbox-group", { t({ "<el-checkbox-group>" }), i(1), t({ "</el-checkbox-group>" }) }),
	s("el-checkbox-button", { t({ "<el-checkbox-button>" }), i(1), t({ "</el-checkbox-button>" }) }),
	s("el-input", { t({ "<el-input>" }), i(1), t({ "</el-input>" }) }),
	s("el-input-number", { t({ "<el-input-number>" }), i(1), t({ "</el-input-number>" }) }),
	s("el-select", { t({ "<el-select>" }), i(1), t({ "</el-select>" }) }),
	s("el-option", { t({ "<el-option>" }), i(1), t({ "</el-option>" }) }),
	s("el-cascader", { t({ "<el-cascader>" }), i(1), t({ "</el-cascader>" }) }),
	s("el-switch", { t({ "<el-switch>" }), i(1), t({ "</el-switch>" }) }),
	s("el-slider", { t({ "<el-slider>" }), i(1), t({ "</el-slider>" }) }),
	s("el-time-picker", { t({ "<el-time-picker>" }), i(1), t({ "</el-time-picker>" }) }),
	s("el-time-select", { t({ "<el-time-select>" }), i(1), t({ "</el-time-select>" }) }),
	s("el-date-picker", { t({ "<el-date-picker>" }), i(1), t({ "</el-date-picker>" }) }),
	s("el-upload", { t({ "<el-upload>" }), i(1), t({ "</el-upload>" }) }),
	s("el-color-picker", { t({ "<el-color-picker>" }), i(1), t({ "</el-color-picker>" }) }),
	s("el-el-transfer", { t({ "<el-el-transfer>" }), i(1), t({ "</el-el-transfer>" }) }),
	s("el-form", { t({ "<el-form>" }), i(1), t({ "</el-form>" }) }),
	s("el-form-item", { t({ "<el-form-item>" }), i(1), t({ "</el-form-item>" }) }),
	s("el-table", { t({ "<el-table>" }), i(1), t({ "</el-table>" }) }),
	s("el-table-column", { t({ "<el-table-column>" }), i(1), t({ "</el-table-column>" }) }),
	s("el-tag", { t({ "<el-tag>" }), i(1), t({ "</el-tag>" }) }),
	s("el-tree", { t({ "<el-tree>" }), i(1), t({ "</el-tree>" }) }),
	s("el-pagination", { t({ "<el-pagination>" }), i(1), t({ "</el-pagination>" }) }),
	s("el-badge", { t({ "<el-badge>" }), i(1), t({ "</el-badge>" }) }),
	s("el-alert", { t({ "<el-alert>" }), i(1), t({ "</el-alert>" }) }),
	s("el-menu", { t({ "<el-menu>" }), i(1), t({ "</el-menu>" }) }),
	s("el-menu-item", { t({ "<el-menu-item>" }), i(1), t({ "</el-menu-item>" }) }),
	s("el-submenu", { t({ "<el-submenu>" }), i(1), t({ "</el-submenu>" }) }),
	s("el-tabs", { t({ "<el-tabs>" }), i(1), t({ "</el-tabs>" }) }),
	s("el-tab-pane", { t({ "<el-tab-pane>" }), i(1), t({ "</el-tab-pane>" }) }),
	s("el-breadcrumb", { t({ "<el-breadcrumb>" }), i(1), t({ "</el-breadcrumb>" }) }),
	s("el-breadcrumb-item", { t({ "<el-breadcrumb-item>" }), i(1), t({ "</el-breadcrumb-item>" }) }),
	s("el-page-header", { t({ "<el-page-header>" }), i(1), t({ "</el-page-header>" }) }),
	s("el-dropdown", { t({ "<el-dropdown>" }), i(1), t({ "</el-dropdown>" }) }),
	s("el-dropdown-menu", { t({ "<el-dropdown-menu>" }), i(1), t({ "</el-dropdown-menu>" }) }),
	s("el-steps", { t({ "<el-steps>" }), i(1), t({ "</el-steps>" }) }),
	s("el-step", { t({ "<el-step>" }), i(1), t({ "</el-step>" }) }),
	s("el-dialog", { t({ "<el-dialog>" }), i(1), t({ "</el-dialog>" }) }),
	s("el-tooltip", { t({ "<el-tooltip>" }), i(1), t({ "</el-tooltip>" }) }),
	s("el-popover", { t({ "<el-popover>" }), i(1), t({ "</el-popover>" }) }),
	s("el-popconfirm", { t({ "<el-popconfirm>" }), i(1), t({ "</el-popconfirm>" }) }),
	s("el-card", { t({ "<el-card>" }), i(1), t({ "</el-card>" }) }),
	s("el-carousel", { t({ "<el-carousel>" }), i(1), t({ "</el-carousel>" }) }),
	s("el-collapse", { t({ "<el-collapse>" }), i(1), t({ "</el-collapse>" }) }),
	s("el-collapse-item", { t({ "<el-collapse-item>" }), i(1), t({ "</el-collapse-item>" }) }),
	s("el-timeline", { t({ "<el-timeline>" }), i(1), t({ "</el-timeline>" }) }),
	s("el-timeline-item", { t({ "<el-timeline-item>" }), i(1), t({ "</el-timeline-item>" }) }),
	s("el-divider", { t({ "<el-divider>" }), i(1), t({ "</el-divider>" }) }),
	s("el-calendar", { t({ "<el-calendar>" }), i(1), t({ "</el-calendar>" }) }),
	s("el-image", { t({ "<el-image>" }), i(1), t({ "</el-image>" }) }),
	s("el-backtop", { t({ "<el-backtop>" }), i(1), t({ "</el-backtop>" }) }),
	s("el-avatar", { t({ "<el-avatar>" }), i(1), t({ "</el-avatar>" }) }),
	s("el-drawer", { t({ "<el-drawer>" }), i(1), t({ "</el-drawer>" }) }),
}

return M
