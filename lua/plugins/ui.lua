return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "mocha",

			color_overrides = {
				mocha = {
					base = "#11111b",
					mantle = "#141420",
					crust = "#101018",
					surface0 = "#2a2a3c",
					surface1 = "#34344a",
					surface2 = "#404058",
				},
			},
		},
	},

	-- Zen Mode
	{
		"folke/zen-mode.nvim",
		opts = {},
	},

	-- Indentation Line Guides
	{
		"nvim-mini/mini.indentscope",
		event = "VeryLazy",
		version = "*",
		opts = {
			draw = {
				delay = 100,
			},
			mappings = {
				object_scope = "ii",
				object_scope_with_border = "ai",
				goto_top = "[i",
				goto_bottom = "]i",
			},
			options = {
				border = "both",
				indent_at_cursor = true,
				n_lines = 10000,
				try_as_border = true,
			},
			symbol = "▎",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
	},

	-- Highlight Colors
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},

	-- Icons & Plenary & UI Library for Other Plugins
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
}
