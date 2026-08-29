-- Highlight Colors
require("nvim-highlight-colors").setup()

-- Colorscheme
require("catppuccin").setup({
	flavour = "mocha",
	color_overrides = {
		mocha = {
			base = "#11111b",
			mantle = "#141420",
			crust = "#101018",
			surface0 = "#2a2a3c",
			surface1 = "#34344a",
			surface2 = "#404058",
		},
	},
})

-- Indentation Guides
require("mini.indentscope").setup({
	draw = {
		delay = 100,
	},
	mappings = {
		object_scope = "ii",
		object_scope_with_border = "ai",
		goto_top = "[i",
		goto_bottom = "]i",
	},
	options = {
		border = "both",
		indent_at_cursor = true,
		n_lines = 10000,
		try_as_border = true,
	},
	symbol = "▎",
})

-- Statusline
require("lualine").setup({
	icons_enabled = true,
	theme = "auto",
	component_separators = { left = "", right = "" },
	section_separators = { left = "", right = "" },
})

-- Neotree
require("neo-tree").setup({
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	default_component_configs = {
		icon = { folder_closed = "", folder_open = "" },
		git_status = {
			symbols = {
				added = "+",
				modified = "~",
				deleted = "-",
				renamed = "→",
				untracked = "?",
				ignored = "",
				unstaged = "",
				staged = "✓",
				conflict = "×",
			},
		},
	},
	window = {
		position = "left",
		width = 30,
		mappings = {
			["<CR>"] = "open",
		},
	},
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
	},
})

-- Bufferline
require("bufferline").setup({
	options = {
		separator_style = "thick",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		highlights = {
			background = { bg = "none" },
		},
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
				if error ~= 0 then
					table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
				end
				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
				end
				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
				end
				if info ~= 0 then
					table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
				end
				return result
			end,
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
