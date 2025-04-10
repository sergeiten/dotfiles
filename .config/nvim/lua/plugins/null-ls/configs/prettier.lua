local null_ls = require("null-ls")
-- local conditional = require("null-ls.utils").make_conditional_utils()

-- local has_eslint = conditional.root_has_file(".eslintrc.js")
-- 	or conditional.root_has_file(".eslintrc.json")
-- 	or conditional.root_has_file(".eslintrc.cjs")
-- 	or conditional.root_has_file("eslint.config.js")

local filetypes = {
	"vue",
	"css",
	"scss",
	"html",
	-- "yaml",
	"markdown",
	"json",
	"graphql",

	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}

-- if not has_eslint then
-- 	table.insert(filetypes, "javascript")
-- 	table.insert(filetypes, "javascriptreact")
-- 	table.insert(filetypes, "typescript")
-- 	table.insert(filetypes, "typescriptreact")
-- end

local formatter = null_ls.builtins.formatting.prettierd.with({
	filetypes = filetypes,
	args = {
		"--stdin-filepath",
		"--config-precedence=prefer-file",
		"$FILENAME",
	},
})

return {
	formatter = formatter,
}
