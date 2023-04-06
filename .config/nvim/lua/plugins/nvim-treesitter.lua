-- Name: Treesitter Nvim
-- Description: Treesitter proxy for nvim
-- Link: https://github.com/nvim-treesitter/nvim-treesitter

local treesitter_configs = require("nvim-treesitter.configs")
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------
parser_config.jinja = {
  install_info = {
    url = "~/Developer/tree-sitter-jinja2", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "jinja", -- if filetype does not match the parser name
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
            init_selection = "<C-w>",
            node_incremental = "<C-w>",
            node_decremental = "<C-e>",
        },
    },
})
