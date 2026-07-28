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
local transparent = function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
end

vim.cmd("colorscheme catppuccin-mocha")
-- transparent()
