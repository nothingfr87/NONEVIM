-- Treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({
	ensure_installed = { "c", "cpp", "python", "lua", "html", "css", "javascript", "vim", "vimdoc", "nix" },
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
