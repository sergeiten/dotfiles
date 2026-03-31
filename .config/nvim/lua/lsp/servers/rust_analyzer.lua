local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
})
