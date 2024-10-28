local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local utils = require("null-ls.utils")

local filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"graphql",
}

local diagnostics = null_ls.builtins.diagnostics.eslint_d.with({
	filetypes = filetypes,
	diagnostics_format = "[eslint] #{m}\n(#{c})",
	-- root_dir = utils.root_pattern(".null-ls-root", "Makefile", ".git"),
	-- cwd = helpers.cache.by_bufnr(function(params)
	-- 	return utils.root_pattern(
	-- 		".eslintrc",
	-- 		".eslintrc.js",
	-- 		".eslintrc.cjs",
	-- 		".eslintrc.yaml",
	-- 		".eslintrc.yml",
	-- 		".eslintrc.json"
	-- 	)(params.bufname)
	-- end),
})

-- local formatter = null_ls.builtins.formatting.eslint_d.with({
-- 	-- args = {"--fix", "$FILENAME", "--cache"},
-- 	extra_args = { "--cache" },
-- 	filetypes = filetypes,
-- })

return {
	diagnostics = diagnostics,
	-- formatter = formatter,
}
