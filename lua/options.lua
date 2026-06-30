require("functions")

-- Options
local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Settings
o.tabstop = 2
o.shiftwidth = 2
o.signcolumn = "yes"
o.showtabline = 2
o.tabline = "%!v:lua.buffer_tabline()"
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
o.laststatus = 3
o.ignorecase = false
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_tutor_mode_plugin = 1
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
