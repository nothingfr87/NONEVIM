return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		default_component_configs = {
			icon = { folder_closed = "", folder_open = "" },
			git_status = {
				symbols = {
					added = "+",
					modified = "~",
					deleted = "-",
					renamed = "→",
					untracked = "?",
					ignored = "",
					unstaged = "",
					staged = "✓",
					conflict = "×",
				},
			},
		},
		window = {
			position = "left",
			width = 30,
			mappings = {
				["<CR>"] = "open",
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
		},
	},
}
