local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("html", {
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})
