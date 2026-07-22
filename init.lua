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
vim.cmd("colorscheme catppuccin-mocha")
