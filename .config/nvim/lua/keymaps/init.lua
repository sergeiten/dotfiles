local set_keymap = require("utils.set-keymap")
local set_terminal_keymap = require("utils.set-terminal-keymap")
local keymap_preview = require("ui.keymap-preview")
local goto_preview = require("goto-preview")

------------------------------------------------------------------------------------------
----------------------------------- TERMINAL ---------------------------------------------
------------------------------------------------------------------------------------------
-- set_keymap({
-- 	list = {
-- 		{
-- 			key = "<LEADER>t",
-- 			actions = function()
-- 				vim.cmd("sp term://zsh")
-- 			end,
-- 			description = "Open terminal",
-- 		},
-- 	},
-- })

------------------------------------------------------------------------------------------
----------------------------------- NAVIGATION -------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
	list = {
		{
			key = "<LEADER>o",
			actions = "<C-^>",
			description = "Rotate between last 2 opened buffers",
		},
	},
})

------------------------------------------------------------------------------------------
----------------------------------- LSP --------------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
	list = {
		{
			key = "K",
			actions = vim.lsp.buf.hover,
			description = "Show variable documentation in floating buffer",
		},
		{
			key = "<LEADER>rn",
			actions = vim.lsp.buf.rename,
			description = "Rename variable",
		},
		{
			key = "H",
			actions = function()
				vim.diagnostic.open_float(0, { scope = "line" })
			end,
			description = "Show diagnostic in a floating buffer",
		},
		{
			key = "ga",
			actions = vim.lsp.buf.code_action,
			description = "Display code action list menu in floating buffer",
		},
		{
			key = "gd",
			actions = vim.lsp.buf.definition,
			description = "Go to definition",
		},
		{
			key = "gdl",
			actions = function()
				vim.cmd(":vsplit")
				vim.lsp.buf.definition()
			end,
			description = "Go to definition in vertical split",
		},
		{
			key = "gdj",
			actions = function()
				vim.cmd(":split")
				vim.lsp.buf.definition()
			end,
			description = "Go to definition in horizontal split",
		},
		{
			key = "]d",
			actions = vim.diagnostic.goto_next,
			description = "Go to next diagnostic in current buffer",
		},
		{
			key = "[d",
			actions = vim.diagnostic.goto_prev,
			description = "Go to previous diagnostic in current buffer",
		},
		{
			key = "<LEADER>lre",
			actions = function()
				vim.cmd("LspRestart")
			end,
			description = "Restart LSP server",
		},
	},
})

------------------------------------------------------------------------------------------
----------------------------------- BUFFER -----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
	list = {
		{
			key = "<C-s>",
			actions = "<C-w><",
			description = "Shift buffer to the left",
		},
		{
			key = "<C-a>",
			actions = "<C-w>>",
			description = "Shift buffer to the right",
		},
		{
			key = "<BS>",
			actions = function()
				vim.cmd("nohlsearch")
			end,
			description = "Clear search highlight",
		},
		{
			key = "n",
			actions = "nzzzv",
			description = "Center the next search result jump inside buffer",
		},
		{
			key = "N",
			actions = "Nzzzv",
			description = "Center the next search result jump inside buffer",
		},
	},
})

------------------------------------------------------------------------------------------
----------------------------------- MISC -------------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
	list = {
		{
			key = "<LEADER>mm",
			actions = "<CMD>messages<CR>",
			description = "See neovim log",
		},
		{
			key = "<LEADER>km",
			actions = keymap_preview.toggle,
			description = "Toggle keymap previewer",
		},
		{
			key = "<LEADER>=",
			actions = "<C-w>=",
			description = "Make splits size equal",
		},
		{
			key = "<LEADER>c",
			actions = ":lclose | :cclose<CR>",
			description = "Close location list or quickfix",
		},
	},
})

set_keymap({
	list = {
		{
			key = "gp",
			actions = function()
				goto_preview.goto_preview_definition()
			end,
			description = "See neovim log",
		},
	},
})

set_keymap({
	list = {
		{
			key = "<LEADER>d",
			actions = function()
				vim.diagnostic.setqflist()
			end,
			description = "Open diagnostic in quickfix",
		},
		{
			key = "<LEADER>de",
			actions = function()
				vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
			end,
			description = "Open diagnostic errors only in quickfix",
		},
	},
})
