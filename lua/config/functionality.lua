-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	blame_formatter = nil,
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil,
	max_file_length = 40000,
	preview_config = {
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

-- Treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({
	ensure_installed = { "c", "cpp", "python", "lua", "html", "css", "javascript", "vim", "vimdoc", "nix", "markdown" },
})

-- Which Key
local whichkey = require("which-key")

whichkey.setup({ preset = "helix" })
whichkey.keys = {
	"<leader>?",
	function()
		whichkey.show({ global = false })
	end,
	desc = "Buffer Local Keymaps (which-key)",
}

-- Code Runner
require("code_runner").setup({
	filetype = {
		c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
		cpp = "cd $dir && g++ $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
		python = "python3 -u",
		lua = "lua $fileName",
	},
})

-- Render Markdown
require("render-markdown").setup({
	latex = { enabled = false },
	yaml = { enabled = false },
})
