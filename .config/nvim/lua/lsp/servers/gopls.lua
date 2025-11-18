local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("gopls", {
	capabilities = capabilities,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_markers = {
		"go.work",
		"go.mod",
		".git",
	},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

vim.lsp.enable("gopls")
