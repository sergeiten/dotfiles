-- Name: Treesitter Nvim
-- Description: Treesitter proxy for nvim
-- Link: https://github.com/nvim-treesitter/nvim-treesitter

local treesitter_configs = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

parser_config.blade = {
	install_info = {
		url = "github.com/EmranMR/tree-sitter-blade", -- local path or git repo
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "main", -- default branch in case of git repo if different from master
	},
	filetype = "blade", -- if filetype does not match the parser name
}

treesitter_configs.setup({
	ensure_installed = {
		"php",
		"go",
		"css",
		"scss",
		"bash",
		"make",
		"markdown",
		"html",
		"typescript",
		"toml",
		"dockerfile",
		"vim",
		"rust",
		"javascript",
		"json",
		"python",
		"gomod",
		"lua",
		"java",
		"yaml",
		"tsx",
		"dart",
	},
	highlight = {
		enable = true,
		disable = function(_, bufnr)
			return vim.api.nvim_buf_line_count(bufnr) > 5000
		end,
	},
	autotag = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-]>",
			node_incremental = "<C-]>",
			node_decremental = "<C-[>",
		},
	},
})
