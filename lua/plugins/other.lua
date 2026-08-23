return {
	-- Toggle Term
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		version = "*",
		opts = {},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Auto Pair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Render Markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = false,
	},

	-- Cord
	{
		"vyfor/cord.nvim",
		opts = {
			theme = "catppuccin",
		},
	},

	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
