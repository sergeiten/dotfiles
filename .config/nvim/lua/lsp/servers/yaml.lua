local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("yamlls", {
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = true
	end,
	schemaStore = {
		enable = true,
	},
})
