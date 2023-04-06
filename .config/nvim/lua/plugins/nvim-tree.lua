-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/kyazdani42/nvim-tree.lua

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP -----------------------------------------------
------------------------------------------------------------------------------------------
require("nvim-tree").setup({
    view = {
        --width = 60,
        mappings = {
            list = {
                { key = "d", action = "trash" },
            },
        },
    },
    respect_buf_cwd = true,
    renderer = {
        special_files = {},
        highlight_git = true,
        icons = {
            show = {
                git = false,
                folder = true,
                file = true,
                folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
    git = {
        ignore = false,
        show_on_dirs = false,
    },
    sort_by = "case_sensitive",
    filters = {
        custom = {
            "^.null-ls",
        },
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<C-n>",
            actions = function()
                vim.cmd("NvimTreeToggle")
            end,
            description = "Toggle file tree",
        },
        {
            key = "<LEADER>to",
            actions = function()
                vim.cmd("NvimTreeFindFile")
            end,
            description = "Find opened file in tree",
        },
        {
            key = "<LEADER>tr",
            actions = function()
                vim.cmd("NvimTreeRefresh")
            end,
            description = "Refresh tree (git, nodes...)",
        },
        {
            key = "<LEADER>tk",
            actions = function()
                require("nvim-tree.lib").collapse_all()
                vim.cmd("NvimTreeFindFile")
            end,
            description = "Collapse all tree nodes and focus opened buffer",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- MISC ----------------------------------------------
------------------------------------------------------------------------------------------
vim.cmd([[
    " Exit vim if there is only nvim-tree buffer left
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
