local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("bashls", {
	capabilities = capabilities,
})
