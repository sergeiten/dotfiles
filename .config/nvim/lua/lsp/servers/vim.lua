local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("vimls", {
	capabilities = capabilities,
})
