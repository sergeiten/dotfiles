-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

-- local indent_blankline = require("indent_blankline")
local ibl = require("ibl")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

ibl.setup({
	indent = {
		char = "▏",
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
		exclude = { language = { "lua" } },
		highlight = { "Function", "Label" },
	},
	exclude = {
		filetypes = {
			"NvimTree",
			"alpha",
			"packer",
			"code-action-menu-menu",
			"lsp-installer",
			"toggleterm",
			"help",
			"null-ls-info",
		},
	},
	-- filetype_exclude = {
	-- 	"NvimTree",
	-- 	"alpha",
	-- 	"packer",
	-- 	"code-action-menu-menu",
	-- 	"lsp-installer",
	-- 	"toggleterm",
	-- 	"help",
	-- 	"null-ls-info",
	-- 	"",
	-- },
})
