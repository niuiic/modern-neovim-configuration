local keymap_amend = require("keymap-amend")
local mapping = require("pretty-fold.preview").mapping

keymap_amend("n", "h", mapping.show_close_preview_open_fold, {})
keymap_amend("n", "l", mapping.close_preview_open_fold, {})

-- zf to create fold
-- zd, zM to delete fold
-- zr, zR to open fold
-- zm, zM to close fold
