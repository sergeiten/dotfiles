require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"php",
		"go",
		"css",
		"scss",
		"bash",
		"make",
		"markdown",
		"html",
		"typescript",
		"toml",
		"dockerfile",
		"vim",
		"rust",
		"javascript",
		"json",
		"python",
		"gomod",
		"lua",
		"java",
		"yaml",
		"tsx",
		"hocon",
	},
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
