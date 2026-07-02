return {
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = { "html", "cssls", "ts_ls", "lua_ls", "pyright", "clangd", "emmet_ls" }

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

			vim.lsp.enable(servers)
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
						item.menu = ""
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
