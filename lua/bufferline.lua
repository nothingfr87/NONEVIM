-- Bufferline
vim.api.nvim_set_hl(0, "TabLineDiagError", {
	fg = "#f38ba8",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "TabLineDiagWarn", {
	fg = "#f9e2af",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "TabLineDiagHint", {
	fg = "#74c7ec",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "TabLineDiagInfo", {
	fg = "#89dceb",
	bg = "#181825",
})
vim.api.nvim_set_hl(0, "TabLineFileName", {
	fg = "#6c7086",
	bg = "#181825",
})

vim.api.nvim_set_hl(0, "TabLineFileNameSelected", {
	fg = "#cba6f7",
	bg = "#181825",
	bold = true,
})

_G.get_buffer_icon = function(buf)
	local ok, icons = pcall(require, "nvim-web-devicons")
	if not ok then
		return ""
	end

	local path = vim.api.nvim_buf_get_name(buf)
	local name = vim.fn.fnamemodify(path, ":t")
	local ext = vim.fn.fnamemodify(path, ":e")

	local icon = icons.get_icon(name, ext, { default = true })
	return (icon or "") .. " "
end

_G.diags = function(buf)
	local counts = {
		[vim.diagnostic.severity.ERROR] = 0,
		[vim.diagnostic.severity.WARN] = 0,
		[vim.diagnostic.severity.INFO] = 0,
		[vim.diagnostic.severity.HINT] = 0,
	}

	for _, d in ipairs(vim.diagnostic.get(buf)) do
		counts[d.severity] = counts[d.severity] + 1
	end

	local s = ""

	if counts[vim.diagnostic.severity.ERROR] > 0 then
		s = s .. "%#TabLineDiagError#" .. "  " .. counts[vim.diagnostic.severity.ERROR]
	end

	if counts[vim.diagnostic.severity.WARN] > 0 then
		s = s .. "%#TabLineDiagWarn#" .. "  " .. counts[vim.diagnostic.severity.WARN]
	end

	if counts[vim.diagnostic.severity.INFO] > 0 then
		s = s .. "%#TabLineDiagInfo#" .. "  " .. counts[vim.diagnostic.severity.INFO]
	end

	if counts[vim.diagnostic.severity.HINT] > 0 then
		s = s .. "%#TabLineDiagHint#" .. " 󰌵 " .. counts[vim.diagnostic.severity.HINT]
	end

	return s
end

function _G.buffer_tabline()
	local s = ""
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buflisted then
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
			if name == "" then
				name = "[No Name]"
			end
			local tab_hl, file_hl
			if buf == current then
				tab_hl = "%#TabLineSel#"
				file_hl = "%#TabLineFileNameSelected#"
			else
				tab_hl = "%#TabLine#"
				file_hl = "%#TabLineFileName#"
			end
			s = s .. tab_hl .. " " .. _G.get_buffer_icon(buf) .. file_hl .. name .. diags(buf) .. tab_hl .. " "
		end
	end
	return s .. "%#TabLineFill#"
end
