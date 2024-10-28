-- Name: Feline
-- Description: Status line
-- Link: https://github.com/feline-nvim/feline.nvim

local feline = require("feline")

local repository_name = require("plugins.feline.components.repository-name")
local git_branch = require("plugins.feline.components.git-branch")
local file_name = require("plugins.feline.components.file-name")
local diagnostics = require("plugins.feline.components.diagnostics")
local git_diff = require("plugins.feline.components.git-diff")
local lsp_status = require("plugins.feline.components.lsp-status")
local position = require("plugins.feline.components.position")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

feline.setup({
	components = {
		active = {
			{
				repository_name,
				git_branch,
				file_name,
				diagnostics.errors,
				diagnostics.hints,
				diagnostics.info,
				diagnostics.warnings,
				git_diff.added,
				git_diff.removed,
				git_diff.changed,
				lsp_status,
			},
			{
				position,
				{
					provider = "line_percentage",
				},
				{
					provider = "scroll_bar",
				},
				{
					provider = {
						name = "file_size",
					},
				},
			},
		},
	},
	force_inactive = {
		buftypes = { "^terminal$" },
		filetypes = { "^NvimTree$" },
	},
})
