-- local lsp = require("lspconfig")
--
-- local capabilities = require("lsp.utils.capabilities")
--
-- lsp.eslint.setup({
-- 	root_dir = lsp.util.root_pattern(
-- 		".eslintrc",
-- 		".eslintrc.js",
-- 		".eslintrc.cjs",
-- 		".eslintrc.yaml",
-- 		".eslintrc.yml",
-- 		".eslintrc.json"
-- 	),
-- 	capabilities = capabilities,
-- 	on_attach = function(client, bufnr)
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			buffer = bufnr,
-- 			command = "EslintFixAll",
-- 		})
-- 	end,
-- })
