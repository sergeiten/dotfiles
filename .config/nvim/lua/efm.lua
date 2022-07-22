local M = {}

local lspconfig = require("lspconfig")

local stylua = require("efm/stylua")
local luacheck = require("efm/luacheck")
local staticcheck = require("efm/staticcheck")
local go_vet = require("efm/go_vet")
local goimports = require("efm/goimports")
local black = require("efm/black")
local isort = require("efm/isort")
local flake8 = require("efm/flake8")
local mypy = require("efm/mypy")
local prettier = require("efm/prettier")
local eslint = require("efm/eslint")
local shellcheck = require("efm/shellcheck")
local shfmt = require("efm/shfmt")

function M.setup(opts)
	lspconfig.efm.setup({
		capabilities = opts.capabilities,
		cmd = { "efm-langserver" },
		on_attach = opts.on_attach,
		init_options = {
			documentFormatting = true,
			hover = false,
			documentSymbol = false,
			codeAction = false,
			completion = false,
		},
		root_dir = vim.loop.cwd,
		settings = {
			rootMarkers = { ".git/" },
			lintDebounce = 100,
			-- logLevel = 5,
			languages = {
				go = { staticcheck, goimports, go_vet },
				lua = { stylua, luacheck },
				python = { black, isort, flake8, mypy },
				typescript = { prettier, eslint },
				javascript = { prettier, eslint },
				typescriptreact = { prettier, eslint },
				javascriptreact = { prettier, eslint },
				yaml = { prettier },
				json = { prettier },
				html = { prettier },
				scss = { prettier },
				css = { prettier },
				markdown = { prettier },
				-- sh = { shellcheck, shfmt },
				sh = { shfmt },
			},
		},
	})
end

return M
