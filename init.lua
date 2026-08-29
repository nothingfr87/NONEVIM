-- Options
require("options")

-- Basic setup
require("setup")

-- Plugin manager
require("config.lazy")

-- UI
require("config.ui")

-- LSP 
require("config.lsp")

-- Keymaps
require("mappings")

-- Theme
_G.transparent = function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
end

vim.cmd("colorscheme catppuccin")
