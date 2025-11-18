local lint = require("lint")

lint.linters.flake8.cmd = function()
	-- Looks for .venv/bin/flake8 in current directory upwards
	local cwd = vim.fn.getcwd()
	local venv_pylint = cwd .. "/.venv/bin/flake8"
	if vim.fn.executable(venv_pylint) == 1 then
		return venv_pylint
	end
	return "flake8" -- fallback to system pylint
end

lint.linters_by_ft = {
	markdown = { "vale" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	python = { "flake8" },
	yaml = { "yamllint" },
	css = { "stylelint" },
	php = { "phpstan" },
	go = { "golangcilint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
