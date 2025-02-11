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
			n = {
				["<c-d>"] = actions.delete_buffer,
			},
			i = {
				["<esc>"] = actions.close,
				["<c-d>"] = actions.delete_buffer,
			},
		},
		file_ignore_patterns = {
			"package-lock.json",
			"node_modules",
			"yarn.lock",
			".next",
			".idea",
			".yarn",
			".svg",
		},
		layout_strategy = "vertical",
		layout_config = { height = 0.95 },
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
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
			key = "<LEADER>s",
			actions = function()
				builtin.resume({
					noremap = true,
					silent = true,
					desc = "Resume",
				})
			end,
			description = "Resume",
		},
		{
			key = "<LEADER>r",
			actions = builtin.lsp_document_symbols,
			description = "Find symbols in project",
		},
		{
			key = "<LEADER>b",
			actions = function()
				builtin.buffers({
					sort_lastused = true,
					ignore_current_buffer = true,
				})
			end,
			description = "Buffers",
		},
		{
			key = "<LEADER>pd",
			actions = function()
				builtin.diagnostics({ severity_bound = 0 })
			end,
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
