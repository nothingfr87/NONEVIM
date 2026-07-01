-- Other Plugins
-- ToggleTerm
require("toggleterm").setup()

-- Auto Pairs
require("nvim-autopairs").setup()

-- TS Auto Tag
require("nvim-ts-autotag").setup({
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})

-- Todo Highlight
require("todo_hl").setup()
