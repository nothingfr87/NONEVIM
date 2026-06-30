-- UI Plugins Configuration

-- Catppuccin
require("catppuccin").setup({
	integrations = {
		statusline = true,
	},
})

-- Indentscope
require("mini.indentscope").setup({
	symbol = "▎",
	options = {
		try_as_border = true,
	},
})

-- Highlight Colors
require("nvim-highlight-colors").setup({})

-- -- Bufferline
-- require("bufferline").setup({
-- 	options = {
-- 		separator_style = "thick",
-- 		hover = {
-- 			enabled = true,
-- 			delay = 200,
-- 			reveal = { "close" },
-- 		},
-- 		custom_areas = {
-- 			right = function()
-- 				local result = {}
-- 				local seve = vim.diagnostic.severity
-- 				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
-- 				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
-- 				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
-- 				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
-- 				if error ~= 0 then
-- 					table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
-- 				end
-- 				if warning ~= 0 then
-- 					table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
-- 				end
-- 				if hint ~= 0 then
-- 					table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
-- 				end
-- 				if info ~= 0 then
-- 					table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
-- 				end
-- 				return result
-- 			end,
-- 		},
-- 		offsets = {
-- 			{
-- 				filetype = "neo-tree",
-- 				text = "File Explorer",
-- 				highlight = "Directory",
-- 				text_align = "left",
-- 			},
-- 		},
-- 	},
-- })
--
-- -- Lualine
-- require("lualine").setup({
-- 	require("lualine").setup({
-- 		options = {
-- 			theme = "auto",
-- 			component_separators = "",
-- 			section_separators = { left = "", right = "" },
-- 		},
-- 		sections = {
-- 			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
-- 			lualine_b = { "filename", "branch" },
-- 			lualine_c = {
-- 				"%=",
-- 			},
-- 			lualine_x = {},
-- 			lualine_y = { "filetype", "progress" },
-- 			lualine_z = {
-- 				{ "location", separator = { right = "" }, left_padding = 2 },
-- 			},
-- 		},
-- 		inactive_sections = {
-- 			lualine_a = { "filename" },
-- 			lualine_b = {},
-- 			lualine_c = {},
-- 			lualine_x = {},
-- 			lualine_y = {},
-- 			lualine_z = { "location" },
-- 		},
-- 		tabline = {},
-- 		extensions = {},
-- 	}),
-- })

-- Neotree
-- require("neo-tree").setup({
-- 	popup_border_style = "rounded",
-- 	enable_git_status = true,
-- 	enable_diagnostics = true,
-- 	default_component_configs = {
-- 		icon = { folder_closed = "", folder_open = "" },
-- 		git_status = {
-- 			symbols = {
-- 				added = "+",
-- 				modified = "~",
-- 				deleted = "-",
-- 				renamed = "→",
-- 				untracked = "?",
-- 				ignored = "",
-- 				unstaged = "",
-- 				staged = "✓",
-- 				conflict = "×",
-- 			},
-- 		},
-- 	},
-- 	window = {
-- 		position = "left",
-- 		width = 30,
-- 		mappings = {
-- 			["<CR>"] = "open",
-- 		},
-- 	},
-- 	filesystem = {
-- 		follow_current_file = {
-- 			enabled = true,
-- 		},
-- 	},
-- })
