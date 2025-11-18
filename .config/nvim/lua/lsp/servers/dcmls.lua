local lsp = require("lspconfig")
local capabilities = require("lsp.utils.capabilities")

local dartExcludedFolders = {
	vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
	vim.fn.expand("$HOME/.pub-cache"),
	vim.fn.expand("/opt/homebrew/"),
	vim.fn.expand("$HOME/tools/flutter/"),
}

lsp.dcmls.setup({
	capabilities = capabilities,
	cmd = {
		"dcm",
		"start-server",
		"--client=neovim",
	},
	filetypes = { "dart", "yaml" },
	settings = {
		dart = {
			analysisExcludedFolders = dartExcludedFolders,
		},
	},
})
