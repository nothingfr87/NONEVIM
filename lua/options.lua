require("functions")

-- Git Branch Autocmd
local git_branch_augroup = vim.api.nvim_create_augroup("GitBranchStatusline", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	group = git_branch_augroup,
	callback = function()
		vim.b.git_branch = get_git_branch()
	end,
})

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
o.showmode = false
o.statusline =
	"%{v:lua.mode_comp()} | %{b:git_branch != '' ? ' ' . b:git_branch . ' ' : ''} | %.30t | %= %{v:lua.lsp_diagnostics()} | %{v:lua.os_name()} | %{&fileencoding?&fileencoding:&encoding} | %{v:lua.get_file_icon()}%{&filetype} | %P | %l:%c"
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
