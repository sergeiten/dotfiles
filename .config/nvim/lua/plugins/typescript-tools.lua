local typescript_tools = require("typescript-tools")
local set_keymap = require("utils.set-keymap")

typescript_tools.setup({
	on_attach = function()
		set_keymap({
			list = {
				{
					key = "<LEADER>toi",
					actions = function()
						vim.cmd("TSToolsOrganizeImports")
					end,
					description = "Sorts and removes unused imports",
				},
				{
					key = "<LEADER>tai",
					actions = function()
						vim.cmd("TSToolsAddMissingImports")
					end,
					description = "Import all missing typescript types",
				},
				{
					key = "<LEADER>tru",
					actions = function()
						vim.cmd("TSToolsRemoveUnused")
					end,
					description = "Removes all unused statements",
				},
				{
					key = "<LEADER>tfr",
					actions = function()
						vim.cmd("TSToolsFileReferences")
					end,
					description = "Find files that reference the current file",
				},
				{
					key = "<LEADER>trf",
					actions = function()
						vim.cmd("TSToolsRenameFile")
					end,
					description = "Rename file with typescript server",
				},
			},
		})
	end,
})
