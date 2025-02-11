-- Name: oil.nvim
-- Description: A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
-- Link: https://github.com/stevearc/oil.nvim

local set_keymap = require("utils.set-keymap")
local oil = require("oil")

oil.setup({
	delete_to_trash = true,
	watch_for_changes = true,
	keymaps = {
		["q"] = { "actions.close", mode = "n" },
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
	},
	view_options = {
		show_hidden = true,
	},
})

set_keymap({
	list = {
		{
			key = "<LEADER>e",
			actions = oil.open_float,
			description = "Oil file explorer",
		},
	},
})
