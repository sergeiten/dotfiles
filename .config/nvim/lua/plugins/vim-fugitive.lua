-- Name: vim-fugitive
-- Description: Fugitive is the premier Vim plugin for Git
-- Link: https://github.com/tpope/vim-fugitive

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>gf",
            actions = function()
                vim.cmd("diffget //2")
            end,
            description = "Open two splits diff",
        },
        {
            key = "<LEADER>gh",
            actions = function()
                vim.cmd("diffget //3")
            end,
            description = "Open three splits diff",
        },
        {
            key = "<LEADER>gs",
            actions = function()
                vim.cmd("G")
            end,
            description = "Git status",
        },
        {
            key = "<LEADER>gc",
            actions = function()
                vim.cmd("Git commit")
            end,
            description = "Git commit",
        },
        {
            key = "<LEADER>gp",
            actions = function()
                vim.cmd("Git push")
            end,
            description = "Git push",
        },
    },
})
