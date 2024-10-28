local coverage = require("coverage")

coverage.setup({
	lang = {
		php = {
			coverage_file = "cobertura.xml",
		},
	},
})
