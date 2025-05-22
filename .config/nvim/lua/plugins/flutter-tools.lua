local flutter_tools = require("flutter-tools")
local capabilities = require("lsp.utils.capabilities")

flutter_tools.setup({
	flutter_path = "/Users/sergeiten/Developer/flutter/bin/flutter",
	lsp = {
		cmd = { "dart", "language-server", "--protocol=lsp" },
		filetypes = { "dart" },
		init_options = {
			closingLabels = true,
			outline = true,
			flutterOutline = true,
		},
		settings = {
			dart = {
				enableSdkFormatter = true,
			},
		},
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = true
		end,
		capabilities = capabilities,
	},
})

flutter_tools.setup_project({
	name = "Posture360",
	target = "lib/main.dart",
	cwd = "posture360/",
})
