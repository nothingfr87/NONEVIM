require("functions")

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

-- Mode Component for Statusline
_G.mode_comp = function()
	modes = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["v"] = "VISUAL",
		["V"] = "VISUAL LINE",
		["\v"] = "VISUAL BLOCK",
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
vim.opt.statusline =
	"%{v:lua.mode_comp()} | %{b:git_branch != '' ? ' ' . b:git_branch . ' ' : ''} | %.30t | %= %{v:lua.lsp_diagnostics()} | %{v:lua.os_name()} | %{&fileencoding?&fileencoding:&encoding} | %{v:lua.get_file_icon()}%{&filetype} | %P | %l:%c"
