-- Name: Git Signs
-- Description: Git line status in sidebar
-- Link: https://github.com/lewis6991/gitsigns.nvim

local git_signs = require("gitsigns")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAdd" })
vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitSignsChange" })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitSignsChange" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangeLn" })
vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChangeNr" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDelete" })
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "GitSignsDelete" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "GitSignsDeleteLn" })
vim.api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDeleteNr" })

git_signs.setup({
	signs = {
		-- add = {
		-- 	hl = "GitSignsAdd",
		-- 	text = "█",
		-- 	numhl = "GitSignsAddNr",
		-- 	linehl = "GitSignsAddLn",
		-- },
		-- change = {
		-- 	hl = "GitSignsChange",
		-- 	text = "█",
		-- 	numhl = "GitSignsChangeNr",
		-- 	linehl = "GitSignsChangeLn",
		-- },
		-- delete = {
		-- 	hl = "GitSignsDelete",
		-- 	text = "█",
		-- 	numhl = "GitSignsDeleteNr",
		-- 	linehl = "GitSignsDeleteLn",
		-- },
		-- topdelete = {
		-- 	hl = "GitSignsDelete",
		-- 	text = "█",
		-- 	numhl = "GitSignsDeleteNr",
		-- 	linehl = "GitSignsDeleteLn",
		-- },
		-- changedelete = {
		-- 	hl = "GitSignsChange",
		-- 	text = "█",
		-- 	numhl = "GitSignsChangeNr",
		-- 	linehl = "GitSignsChangeLn",
		-- },
	},
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 300,
	},
	on_attach = function(buffer_number)
		-- TODO: cleanup
		local plugin = package.loaded.gitsigns

		local function map(mode, key, action, options)
			options = options or {}
			options.buffer = buffer_number

			vim.keymap.set(mode, key, action, options)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		map({ "n", "v" }, "<leader>hs", plugin.stage_hunk)
		map({ "n", "v" }, "<leader>hr", plugin.reset_hunk)
		map("n", "<leader>hS", plugin.stage_buffer)
		map("n", "<leader>hu", plugin.undo_stage_hunk)
		map("n", "<leader>hR", plugin.reset_buffer)
		map("n", "<leader>hp", plugin.preview_hunk)
		map("n", "<leader>tb", plugin.toggle_current_line_blame)
		map("n", "<leader>hd", plugin.diffthis)
		map("n", "<leader>td", plugin.toggle_deleted)
		map("n", "<leader>hD", function()
			plugin.diffthis("~")
		end)
		map("n", "<leader>hb", function()
			plugin.blame_line({ full = true })
		end)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
	list = {
		{ group = "GitSignsAdd", foreground = colors.green },
		{ group = "GitSignsChange", foreground = colors.orange },
		{ group = "GitSignsDelete", foreground = colors.red },
		{ group = "GitSignsCurrentLineBlame", foreground = colors.grey, background = colors.grey_lighter },
	},
})
