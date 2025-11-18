local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("cssls", {
	capabilities = capabilities,
})
