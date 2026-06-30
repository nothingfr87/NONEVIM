require("functions")

-- API Edits
vim.api.nvim_set_hl(0, "StatusLineGitBranch", {
	fg = "#cdd6f4",
	bg = "#313244",
})
vim.api.nvim_set_hl(0, "StatusLineBranchSep", {
	fg = "#313244",
	bg = "#1e1e2e",
})
-- LSP Diagnostics
vim.api.nvim_set_hl(0, "StatusLineDiagError", {
	fg = "#f38ba8",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "StatusLineDiagWarn", {
	fg = "#f9e2af",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "StatusLineDiagHint", {
	fg = "#74c7ec",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "StatusLineDiagInfo", {
	fg = "#89dceb",
	bg = "#181825",
})

-- Statusline functions

-- Git Branch (For Statusline)
function get_git_branch()
	if vim.fn.isdirectory(".git") ~= 0 then
		local branch = vim.fn.system("git branch --show-current 2>/dev/null")
		branch = branch:gsub("[%z\n\r]+$", "")
		if branch ~= "" then
			return "" .. " " .. branch
		end
	end
	return ""
end

-- OS Name Component for statusline
_G.os_name = function()
	local os = vim.loop.os_uname().sysname

	local icons = {
		Linux = "",
		Darwin = "󰀵",
		Windows_NT = "󰍲",
		FreeBSD = "󰣠",
		OpenBSD = "󰈺",
		NetBSD = "󰈺",
	}

	return string.format(icons[os] or "󰈙")
end

-- File icons for statusline
_G.get_file_icon = function()
	local ok, icons = pcall(require, "nvim-web-devicons")
	if not ok then
		return ""
	end
	local f = vim.fn.expand("%:t")
	local e = vim.fn.expand("%:e")
	local icon = icons.get_icon(f, e, { default = true })
	return icon and icon .. " " or ""
end

-- LSP Diagnositcs for Statusline
_G.lsp_errors = function()
	local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	return n > 0 and (" " .. n .. " ") or ""
end

_G.lsp_warnings = function()
	local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	return n > 0 and (" " .. n .. " ") or ""
end

_G.lsp_hints = function()
	local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	return n > 0 and ("󰌵 " .. n .. " ") or ""
end

_G.lsp_infos = function()
	local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	return n > 0 and (" " .. n .. " ") or ""
end

-- Mode Component for Statusline
local mode_colors = {
	n = "#89b4fa",
	no = "#89b4fa",
	i = "#a6e3a1",
	ic = "#a6e3a1",
	v = "#f9e2af",
	V = "#f9e2af",
	["\22"] = "#f9e2af",
	s = "#f5c2e7",
	S = "#f5c2e7",
	["\19"] = "#f5c2e7",
	R = "#f38ba8",
	Rc = "#f38ba8",
	Rv = "#f38ba8",
	c = "#fab387",
	cv = "#fab387",
	ce = "#fab387",
	r = "#94e2d5",
	rm = "#94e2d5",
	["r?"] = "#94e2d5",

	t = "#cba6f7",
}

local function update_statusline_mode_hl()
	local color = mode_colors[vim.api.nvim_get_mode().mode] or "#6c7086"

	vim.api.nvim_set_hl(0, "StatusLineMode", {
		fg = "#11111b",
		bg = color,
		bold = true,
	})

	vim.api.nvim_set_hl(0, "StatusLineModeSep", {
		fg = color,
		bg = "#1e1e2e",
	})
end

local group = vim.api.nvim_create_augroup("StatuslineModeHighlight", { clear = true })
vim.api.nvim_create_autocmd({
	"ModeChanged",
	"VimEnter",
}, {
	group = group,
	callback = update_statusline_mode_hl,
})

_G.mode_comp = function()
	modes = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["v"] = "VISUAL",
		["V"] = "V-LINE",
		["\v"] = "V-BLOCK",
		["s"] = "SELECT",
		["S"] = "SELECT LINE",
		["s"] = "SELECT BLOCK",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["R"] = "REPLACE",
		["Rv"] = "VISUAL REPLACE",
		["c"] = "COMMAND",
		["cv"] = "VIM EX",
		["ce"] = "EX",
		["r"] = "PROMPT",
		["rm"] = "MORE",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "TERMINAL",
	}
	local mode = vim.fn.mode()
	return string.format(" %s ", modes[mode] or "UNKNOWN"):upper()
end

-- Git Branch Autocmd
local git_branch_augroup = vim.api.nvim_create_augroup("GitBranchStatusline", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	group = git_branch_augroup,
	callback = function()
		vim.b.git_branch = get_git_branch()
	end,
})

vim.opt.showmode = false

local status_left = table.concat({
	"%#StatusLineModeSep#",
	"%#StatusLine#",
	"%#StatusLineMode#%{v:lua.mode_comp()} ",

	"%#StatusLine#",
	"%#StatusLineGitBranch#%{b:git_branch != '' ? ' ' . b:git_branch . ' ' : ''}",
	"%#StatusLineBranchSep#",

	"%#StatusLine#",
	" %.30t ",

	" ",

	"%=",
})

local status_diag = table.concat({
	"%#StatusLineDiagError#%{v:lua.lsp_errors()}",
	"%#StatusLineDiagWarn#%{v:lua.lsp_warnings()}",
	"%#StatusLineDiagHint#%{v:lua.lsp_hints()}",
	"%#StatusLineDiagInfo#%{v:lua.lsp_infos()}",
	"%#StatusLine#",
})

local status_right = table.concat({
	" %{v:lua.os_name()}",
	"  %{&fileencoding ? &fileencoding : &encoding}",
	"  %{v:lua.get_file_icon()}%{&filetype}",

	" %#StatusLineBranchSep#",
	"%#StatusLine#",
	"%#StatusLineGitBranch# %P ",

	"%#StatusLineMode# %l:%c",
	"%#StatusLineModeSep#",

	"%#StatusLine#",
})

vim.opt.statusline = status_left .. status_diag .. status_right
