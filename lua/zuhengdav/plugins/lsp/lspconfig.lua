return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
		})

		--configure latex server
		--create a Lua function that loops all the words in the spell file and creates a table of words from it.
		-- local words = {}
		-- for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
		-- 	table.insert(words, word)
		-- end

		lspconfig["ltex"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				ltex = {
					language = "en-US",
				},
			},
			-- filetypes = { "tex", "markdown" },
		})

		lspconfig["texlab"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				texlab = {
					bibtexFormatter = "texlab",
					chktex = {
						onEdit = false,
						onOpenAndSave = false,
					},
					latexFormatter = "latexindent",
					latexindent = {
						modifyLineBreaks = false,
					},
				},
			},
			-- filetypes = { "tex" },
		})

		-- configure julia language	server
		local REVISE_LANGUAGESERVER = false

		lspconfig["julials"].setup({
			on_new_config = function(new_config, _)
				local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
				if REVISE_LANGUAGESERVER then
					new_config.cmd[5] = (new_config.cmd[5]):gsub(
						"using LanguageServer",
						"using Revise; using LanguageServer; if isdefined(LanguageServer, :USE_REVISE); LanguageServer.USE_REVISE[] = true; end"
					)
				elseif require("lspconfig").util.path.is_file(julia) then
					-- NOTE: If you notice, there is a small line named vim.notify("Hello!").
					-- This is to test that julials is engaged when accessing a Julia file - you can check that it is engaged by writing :messages in vim.
					-- You should see "Hello!" appear. This line can then safely be removed.
					-- vim.notify("using julials!")
					new_config.cmd[1] = julia
				end
			end,
			-- This just adds dirname(fname) as a fallback (see nvim-lspconfig#1768).
			root_dir = function(fname)
				local util = require("lspconfig.util")
				return util.root_pattern("Project.toml")(fname)
					or util.find_git_ancestor(fname)
					or util.path.dirname(fname)
			end,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				-- Disable automatic formatexpr since the LS.jl formatter isn't so nice.
				vim.bo[bufnr].formatexpr = ""
			end,
			capabilities = capabilities,
			filetypes = { "julia" },
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
