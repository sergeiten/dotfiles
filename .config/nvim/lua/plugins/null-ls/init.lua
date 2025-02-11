-- Name: Null LS
-- Description: Proxy for linters/formatters
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
local conditional = require("null-ls.utils").make_conditional_utils()

local set_keymap = require("utils.set-keymap")

local prettier = require("plugins.null-ls.configs.prettier")
local eslint = require("plugins.null-ls.configs.eslint")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local formatter = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

null_ls.setup({
	-- debug = true,
	default_timeout = 20000,
	sources = {
		formatter.stylua,
		formatter.fixjson,
		formatter.shfmt.with({ extra_args = { "-i=4" } }),
		formatter.djlint,
		formatter.pint,
		formatter.blade_formatter,
		prettier.formatter,
		-- eslint.formatter,
		eslint.diagnostics,

		diagnostics.shellcheck.with({ extra_args = { "-e SC2034" } }),
		diagnostics.hadolint,
		diagnostics.yamllint.with({
			extra_args = {
				"-d",
				[[{
                    rules: {
                        line-length: { max: 140 },
                        document-start: { present: false }
                    }
                }]],
			},
		}),
		diagnostics.luacheck,
		diagnostics.cspell.with({
			condition = function()
				return conditional.root_has_file("cspell.config.json") or conditional.root_has_file(".cspell.json")
			end,
		}),
		diagnostics.actionlint.with({
			runtime_condition = function(params)
				return params.bufname:find(vim.pesc(".github/workflows")) ~= nil
			end,
		}),
		diagnostics.djlint,
		-- diagnostics.php,
		diagnostics.phpstan,
		-- diagnostics.phpmd.with({
		-- 	extra_args = function()
		-- 		if vim.fn.filereadable("phpmd.xml") == 1 then
		-- 			return { "phpmd.xml" }
		-- 		else
		-- 			return { "cleancode,codesize,controversial,design,naming,unusedcode" }
		-- 		end
		-- 	end,
		-- }),

		actions.eslint_d,
		actions.shellcheck,
		-- actions.gitsigns,

		diagnostics.flake8.with({
			prefer_local = "venv/bin",
		}),
		diagnostics.mypy.with({
			prefer_local = "venv/bin",
		}),
		formatter.black,
		formatter.isort,
		formatter.goimports,
		diagnostics.golangci_lint,
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					async = false,
					filter = function(c)
						return c.name == "null-ls"
					end,
				})
			end,
		})
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						async = false,
						filter = function(c)
							return c.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
	key = ",f",
	actions = function()
		vim.lsp.buf.format({ async = false })
	end,
	description = "Format code",
})
