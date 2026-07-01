-- Options
require("options")

-- Basic setup
require("setup")

-- Plugin manager
require("config.lazy")

-- UI 
require("bufferline")
require("statusline")

-- Keymaps
require("mappings")

-- Theme
vim.cmd("colorscheme catppuccin-mocha")

-- function transparent()
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- end
