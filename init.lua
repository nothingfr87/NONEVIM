-- Install Plugins
vim.pack.add(require("plugins"))

-- Options & Settings
require("setup")

-- Functions
require("functions")

-- Mappings
require("mappings")

-- Plugins Configuration
require("config")

-- Set Theme
local function transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

vim.cmd("colorscheme catppuccin-mocha")
