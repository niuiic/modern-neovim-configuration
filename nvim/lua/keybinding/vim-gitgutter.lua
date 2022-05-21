local utils = require("utils")

utils.fn.mapRegister({
    g = {
        name = "git diff",
        q = {
            "<cmd>GitGutterQuickFix | copen20<CR>",
            "open diff in quickfix window",
        },
        s = {
            "<Plug>(GitGutterStageHunk)",
            "commit the diff",
        },
        u = {
            "<Plug>(GitGutterUndoHunk)",
            "undo the diff",
        },
        p = {
            "<Plug>(GitGutterPreviewHunk)",
            "preview the diff",
        },
        f = {
            "<cmd>GitGutterFold<CR>",
            "fold unchanged lines",
        },
        t = {
            "<cmd>GitGutterLineHighlightsToggle<CR>",
            "toggle line highlight",
        },
        r = {
            "<cmd>GitGutterAll<CR>",
            "refresh",
        },
    },
}, {
    mode = "n",
    prefix = "<localleader>",
})
