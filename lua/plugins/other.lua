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

	-- Auto Close Tag
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {
			per_filetype = {
				["html"] = {
					enable_close = false,
				},
			},
		},
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

	-- Live Server
	{
		"https://git.barrettruth.com/barrettruth/live-server.nvim",
		cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
	},

	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
