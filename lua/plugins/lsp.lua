return {
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Emmet
			vim.lsp.config("emmet_ls", { capabilities = capabilities })
			-- HTML
			vim.lsp.config("html", { capabilities = capabilities })
			-- CSS
			vim.lsp.config("css", { capabilities = capabilities })
			-- JS/TS
			vim.lsp.config("ts_ls", { capabilities = capabilities })
			-- Python
			vim.lsp.config("pyright", { capabilities = capabilities })
			-- C/C++
			vim.lsp.config("clangd", { capabilities = capabilities })
			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.enable({
				"html",
				"css",
				"ts_ls",
				"lua_ls",
				"pyright",
				"clangd",
				"emmet_ls",
			})
		end,
	},

	-- CMP
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
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
						winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
						border = "rounded",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
						border = "rounded",
					}),
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
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		opts = {
			install_dir = vim.fn.stdpath("data") .. "/site",
			install = {
				"python",
				"c",
				"cpp",
				"html",
				"css",
				"javascript",
				"markdown",
				"markdown_inline",
				"latex",
				"yaml",
				"vim",
				"vimdoc",
			},
		},
	},

	-- Conform
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
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
		},
	},
}
