local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.r_language_server.setup({
    capabilities = capabilities,
})
