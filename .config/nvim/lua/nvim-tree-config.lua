require("nvim-tree").setup({
	git = {
		ignore = false,
	},
	disable_netrw = false,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {},
		},
	},
	renderer = {
		icons = {
			webdev_colors = true,
			show = {
				git = false,
				folder = true,
				file = true,
				folder_arrow = true,
			},
		},
		highlight_git = false,
		highlight_opened_files = "0",
	},
})
