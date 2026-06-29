-- VIM API Edits
local api = vim.api
local diagnostic = vim.diagnostic

local signs = {
	Error = " ",
	Warn = " ",
	Hint = "󰌵 ",
	Info = " ",
}
diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	signs = {
		text = {
			[diagnostic.severity.ERROR] = signs.Error,
			[diagnostic.severity.WARN] = signs.Warn,
			[diagnostic.severity.HINT] = signs.Hint,
			[diagnostic.severity.INFO] = signs.Info,
		},
	},
	float = {
		focusable = true,
		border = "single",
		source = "always",
	},
})

-- Indentscope API Edits
api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#cba6f7", bold = true })
		api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true })
	end,
})

-- CMP API Edits
api.nvim_set_hl(0, "CmpNormal", { bg = "#1e1e2e" })
api.nvim_set_hl(0, "CmpBorder", { fg = "#cba6f7", bg = "#1e1e2e" })
api.nvim_set_hl(0, "CmpSel", { bg = "#313244", bold = true })
