local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Settings
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.softtabstop = 2
o.relativenumber = true
o.number = true
o.cursorline = true
o.mousemoveevent = true
o.termguicolors = true
o.swapfile = false
o.mouse = "a"
o.wrap = false
o.ignorecase = false
o.laststatus = 3
o.showmode = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.clipboard = "unnamedplus"
o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

cmd("cnoreabbrev q q!")
cmd("cnoreabbrev qa qall!")
cmd("cnoreabbrev w w!")
cmd("cnoreabbrev wq wq!")
cmd("syntax on")
cmd("filetype plugin indent on")

-- Vim API Edits
vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true })
vim.opt.signcolumn = "yes"

local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},

	float = {
		focusable = true,
		border = "single",
		source = "always",
	},
})
