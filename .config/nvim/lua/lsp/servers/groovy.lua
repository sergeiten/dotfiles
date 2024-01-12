local lsp = require("lspconfig")

local capabilities = require("lsp.utils.capabilities")

lsp.groovyls.setup({
	cmd = { "java", "-jar", "path/to/groovyls/groovy-language-server-all.jar" },
	capabilities = capabilities,
	filetypes = { "nextflow" },
})
