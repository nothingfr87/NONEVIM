-- Install Plugins
vim.pack.add(require("plugins"))

-- Functions
require("functions")

-- Options & Settings
require("setup")
require("options")

-- Mappings
require("mappings")

-- Plugins Configuration
require("other")
require("lsp")
require("ui")

-- Statusline
require("statusline")

-- Set Theme
function transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

vim.cmd("colorscheme catppuccin-mocha")
