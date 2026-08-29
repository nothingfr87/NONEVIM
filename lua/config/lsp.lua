-- LSP Config
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "lua_ls", "clangd", "zls" }

for _, server in ipairs(servers) do
	vim.lsp.config(server, { capabilities = capabilities })
end

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
				ignoreDir = { "node_modules", ".git" },
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.zig",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

vim.lsp.enable(servers)

-- CMP
local cmp = require("cmp")
cmp.setup({
	formatting = {
		fields = { "kind", "abbr", "menu" },
		-- format = function(_, item)
		-- 	local icons = {
		-- 		Text = "󰉿",
		-- 		Method = "󰆧",
		-- 		Function = "󰊕",
		-- 		Constructor = "",
		-- 		Field = "󰜢",
		-- 		Variable = "",
		-- 		Property = "󰖷",
		-- 		Class = "󰠱",
		-- 		Interface = "",
		-- 		Struct = "󰙅",
		-- 		Module = "󰆧",
		-- 		Unit = "󰑭",
		-- 		Value = "󰎠",
		-- 		Enum = "󰦨",
		-- 		EnumMember = "󰦨",
		-- 		Keyword = "󰌋",
		-- 		Constant = "󰏿",
		-- 		Snippet = "",
		-- 		Color = "󰏘",
		-- 		File = "󰈙",
		-- 		Reference = "󰈇",
		-- 		Folder = "󰉋",
		-- 		Event = "",
		-- 		Operator = "󰆕",
		-- 		TypeParameter = "󰊄",
		-- 	}
		-- 	item.menu = ""
		-- 	item.kind = " " .. (icons[item.kind] or "") .. " "
		-- 	return item
		-- end,
	},
	window = {
		completion = {
			max_width = 20,
			max_height = 8,
			winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
		},
		documentation = {
			max_width = 20,
			max_height = 8,
			winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmdline" },
	}),
})
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- Treesitter
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	install = {
		"c",
		"zig",
		"markdown",
		"markdown_inline",
		"latex",
		"yaml",
		"vim",
		"vimdoc",
	},
})

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
