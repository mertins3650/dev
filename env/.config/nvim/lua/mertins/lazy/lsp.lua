return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("K", function()
						vim.lsp.buf.hover()
					end, "Hover")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			local servers = {
				gopls = {},
				ts_ls = {},
				templ = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								library = { "/home/simonm/.local/share/LuaAddons/love2d/library" },
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}

-- return {
-- 	"neovim/nvim-lspconfig",
-- 	dependencies = {
-- 		"stevearc/conform.nvim",
-- 		"williamboman/mason.nvim",
-- 		"williamboman/mason-lspconfig.nvim",
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-path",
-- 		"hrsh7th/cmp-cmdline",
-- 		"hrsh7th/nvim-cmp",
-- 		"L3MON4D3/LuaSnip",
-- 		"saadparwaiz1/cmp_luasnip",
-- 		"j-hui/fidget.nvim",
-- 	},
--
-- 	config = function()
-- 		require("conform").setup({
-- 			formatters_by_ft = {},
-- 		})
-- 		local cmp = require("cmp")
-- 		local cmp_lsp = require("cmp_nvim_lsp")
-- 		local capabilities = vim.tbl_deep_extend(
-- 			"force",
-- 			{},
-- 			vim.lsp.protocol.make_client_capabilities(),
-- 			cmp_lsp.default_capabilities()
-- 		)
--
-- 		require("fidget").setup({})
-- 		require("mason").setup()
-- 		require("mason-lspconfig").setup({
-- 			ensure_installed = {
-- 				"lua_ls",
-- 				"rust_analyzer",
-- 				"gopls",
-- 			},
-- 			handlers = {
-- 				function(server_name) -- default handler (optional)
-- 					require("lspconfig")[server_name].setup({
-- 						capabilities = capabilities,
-- 					})
-- 				end,
--
-- 				zls = function()
-- 					local lspconfig = require("lspconfig")
-- 					lspconfig.zls.setup({
-- 						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
-- 						settings = {
-- 							zls = {
-- 								enable_inlay_hints = true,
-- 								enable_snippets = true,
-- 								warn_style = true,
-- 							},
-- 						},
-- 					})
-- 					vim.g.zig_fmt_parse_errors = 0
-- 					vim.g.zig_fmt_autosave = 0
-- 				end,
-- 				["lua_ls"] = function()
-- 					local lspconfig = require("lspconfig")
-- 					lspconfig.lua_ls.setup({
-- 						capabilities = capabilities,
-- 						settings = {
-- 							Lua = {
-- 								format = {
-- 									enable = true,
-- 									-- Put format options here
-- 									-- NOTE: the value should be STRING!!
-- 									defaultConfig = {
-- 										indent_style = "space",
-- 										indent_size = "2",
-- 									},
-- 								},
-- 							},
-- 						},
-- 					})
-- 				end,
-- 			},
-- 		})
--
-- 		local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- 		cmp.setup({
-- 			snippet = {
-- 				expand = function(args)
-- 					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 				["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 				["<C-Space>"] = cmp.mapping.complete(),
-- 			}),
-- 			sources = cmp.config.sources({
-- 				{ name = "copilot", group_index = 2 },
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" }, -- For luasnip users.
-- 			}, {
-- 				{ name = "buffer" },
-- 			}),
-- 		})
--
-- 		vim.diagnostic.config({
-- 			-- update_in_insert = true,
-- 			float = {
-- 				focusable = false,
-- 				style = "minimal",
-- 				border = "rounded",
-- 				source = "always",
-- 				header = "",
-- 				prefix = "",
-- 			},
-- 		})
-- 	end,
-- }
