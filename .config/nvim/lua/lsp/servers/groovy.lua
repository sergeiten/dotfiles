local capabilities = require("lsp.utils.capabilities")

vim.lsp.config("groovyls", {
	cmd = { "java", "-jar", "path/to/groovyls/groovy-language-server-all.jar" },
	capabilities = capabilities,
	filetypes = { "nextflow" },
})
