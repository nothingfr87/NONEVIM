return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
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
