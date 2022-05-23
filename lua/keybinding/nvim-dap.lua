local utils = require("utils")
local dap = require("dap")

utils.fn.mapRegister({
    d = {
        name = "debug",
        t = {
            function()
                dap.toggle_breakpoint()
            end,
            "toggle breakpoint",
        },
        c = {
            function()
                dap.continue()
            end,
            "continue",
        },
        i = {
            function()
                dap.step_into()
            end,
            "step into",
        },
        o = {
            function()
                dap.step_out()
            end,
            "step into",
        },
        n = {
            function()
                dap.step_over({})
            end,
            "step over",
        },
        b = {
            function()
                dap.step_back()
            end,
            "step back",
        },
        q = {
            function()
                dap.terminate()
            end,
            "quit debug",
        },
    },
}, {
    mode = "n",
    prefix = "<localleader>",
})

utils.fn.map("n", "<A-c>", "<Cmd>lua require('dap').continue()<CR>", utils.var.opt)
utils.fn.map("n", "<A-n>", "<Cmd>lua require('dap').step_over()<CR>", utils.var.opt)
utils.fn.map("n", "<A-t>", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", utils.var.opt)
utils.fn.map("n", "<A-b>", "<Cmd>lua require('dap').step_back()<CR>", utils.var.opt)
utils.fn.map("n", "<A-i>", "<Cmd>lua require('dap').step_into()<CR>", utils.var.opt)
utils.fn.map("n", "<A-o>", "<Cmd>lua require('dap').step_out()<CR>", utils.var.opt)
