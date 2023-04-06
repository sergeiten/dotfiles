-- Name: Telescope
-- Description: Everything finder
-- Link: https://github.com/nvim-telescope/telescope.nvim

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------
telescope.setup({
    defaults = {
        path_display = { "smart" },
		color_devicons = true,
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
        file_ignore_patterns = {
            "package-lock.json",
            "node_modules",
            "yarn.lock",
            ".next",
            ".idea",
            ".yarn",
        },
    },
})

telescope.load_extension("fzf")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------
set_keymap({
    list = {
        {
            key = "<LEADER>pg",
            actions = builtin.git_status,
            description = "Find changed git lines in project",
        },
        {
            key = "<LEADER>f",
            actions = builtin.find_files,
            description = "Find git files in project",
        },
        {
            key = "<LEADER>g",
            actions = builtin.live_grep,
            description = "Find text in project",
        },
        {
            key = "<LEADER>r",
            actions = builtin.lsp_document_symbols,
            description = "Find symbols in project",
        },
        {
            key = ";",
            actions = function()
                builtin.buffers({
                    sort_lastused = true,
                    ignore_current_buffer = true,
                })
            end,
            description = "Buffers",
        },
        {
            key = "<LEADER>pad",
            actions = builtin.diagnostics,
            description = "Find project diagnostics (errors, warnings...)",
        },
        {
            key = "<LEADER>pr",
            actions = builtin.lsp_references,
            description = "Find variable references in project",
        },
        {
            key = "<LEADER>pi",
            actions = builtin.lsp_definitions,
            description = "Find variable definitions/implementations in project",
        },
        {
            key = "<LEADER>hl",
            actions = builtin.highlights,
            description = "See all registered highlight groups",
        },
        {
            key = "<LEADER>gh",
            actions = builtin.help_tags,
            description = "Find in manual pages",
        },
    },
})
