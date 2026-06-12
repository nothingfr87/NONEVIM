return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		opts = {},
	},
	{ "https://git.barrettruth.com/barrettruth/live-server.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "CRAG666/code_runner.nvim", config = true },
}
