-- Options
require("options")

-- Plugin manager
require("config.lazy")

-- Mappings
require("mappings")

-- LSP
require("config.lsp")

-- UI
require("config.ui")

-- Functionality
require("config.functionality")

-- Set Theme
local function transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

vim.cmd("colorscheme catppuccin")
-- transparent()
