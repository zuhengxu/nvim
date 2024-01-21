return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"html",
				"lua_ls",
				"pyright",
				"julials",
				"ltex",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			--
			-- handlers = {
			-- 	function(server_name) --default handler
			-- 		print("setting up ", server_name)
			-- 		require("lspconfig")[server_name].setup({})
			-- 	end,
			-- },

			-- --  If you want to override the default filetypes that your language server will attach to you can
			-- --  define the property 'filetypes' to the map in question.
			local_servers = {
				julials = {
					-- This just adds dirname(fname) as a fallback (see nvim-lspconfig#1768).
					root_dir = function(fname)
						local util = require("lspconfig.util")
						return util.root_pattern("Project.toml")(fname)
							or util.find_git_ancestor(fname)
							or util.path.dirname(fname)
					end,
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"mypy", -- python linter
				"ruff", -- python linter
				-- "pylint", -- python linter
			},
		})
	end,
}
