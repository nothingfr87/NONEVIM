return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {},
	},
	{ "nvim-mini/mini.indentscope", version = "*" },
	{
		"Djancyp/better-comments.nvim",
		config = function()
			require("better-comment").Setup()
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}
