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

-- Options
local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Settings
o.tabstop = 2
o.shiftwidth = 2
o.signcolumn = "yes"
o.expandtab = true
o.softtabstop = 2
o.showtabline = 2
o.tabline = "%!v:lua.buffer_tabline()"
o.relativenumber = true
o.number = true
o.cursorline = true
o.mousemoveevent = true
o.termguicolors = true
o.swapfile = false
o.mouse = "a"
o.wrap = false
o.ignorecase = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_tutor_mode_plugin = 1
o.laststatus = 3
o.showmode = false
o.clipboard = "unnamedplus"
o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
g.live_server = {
	port = 8080,
	browser = false,
}
g.mapleader = " "

cmd("cnoreabbrev q q!")
cmd("cnoreabbrev qa qall!")
cmd("cnoreabbrev w w!")
cmd("cnoreabbrev wq wq!")
cmd("syntax on")
cmd("filetype indent plugin on")

-- Disabling Neovim Providers
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
