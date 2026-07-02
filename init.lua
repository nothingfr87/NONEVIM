-- Options
require("config.options")

-- Basic setup
require("config.setup")

-- Plugin manager
require("config.lazy")

-- UI
-- require("ui.bufferline")
-- require("ui.statusline")

-- Functions
require("config.functions")

-- Keymaps
require("config.mappings")

-- Theme
local function transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

vim.cmd("colorscheme catppuccin-mocha")
-- transparent()
