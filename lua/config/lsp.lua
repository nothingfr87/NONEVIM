-- LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
	"lua_ls",
	"pyright",
	"clangd",
	"ts_ls",
	"html",
	"cssls",
	"emmet_ls",
}

for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		capabilities = capabilities,
	})
end
vim.lsp.enable(servers)

-- CMP
local cmp = require("cmp")
-- vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#181825" })

cmp.setup({
	completion = {
		autocomplete = false,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, item)
			local icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Variable = "",
				File = "󰈙",
				Folder = "󰉋",
				Class = "󰠱",
			}
			item.kind = " " .. (icons[item.kind] or "") .. " "
			return item
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			max_width = 20,
			max_height = 8,
			winhighlight = "Normal:CmpNormal,FloatBorder:FloatBorder",
		}),
		documentation = cmp.config.window.bordered(),
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

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "autopep8" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
