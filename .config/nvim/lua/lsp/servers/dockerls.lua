local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("dockerls", {
	capabilities = capabilities,
})
