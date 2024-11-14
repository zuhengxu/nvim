return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			-- Defer Treesitter setup after first render to improve startup time
			vim.defer_fn(function()
				local config = require("nvim-treesitter.configs")
				config.setup({
					-- Add languages to be installed here that you want installed for treesitter
					ensure_installed = {
						"lua",
						"python",
						"vimdoc",
						"vim",
						"bash",
						"julia",
						"regex",
						"markdown_inline",
						"markdown",
					},

					-- Autoinstall languages that are not installed
					auto_install = true,
					-- Install languages synchronously (only applied to `ensure_installed`)
					sync_install = false,
					-- List of parsers to ignore installing
					ignore_install = {},

					highlight = { enable = true },
					indent = { enable = true },

					-- incremental_selection = {
					-- 	enable = true,
					-- 	keymaps = {
					-- 		init_selection = "<c-space>",
					-- 		node_incremental = "<c-space>",
					-- 		scope_incremental = "<c-s>",
					-- 		node_decremental = "<M-space>",
					-- 	},
					-- },

					textobjects = {
						select = {
							enable = true,
							lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
							keymaps = {
								["aa"] = "@parameter.outer",
								["ia"] = "@parameter.inner",
								["af"] = "@function.outer",
								["if"] = "@function.inner",
								["ac"] = "@class.outer",
								["ic"] = "@class.inner",
							},
						},
						move = {
							enable = true,
							set_jumps = true, -- whether to set jumps in the jumplist
							goto_next_start = {
								["]m"] = "@function.outer",
								["]]"] = "@class.outer",
							},
							goto_next_end = {
								["]M"] = "@function.outer",
								["]["] = "@class.outer",
							},
							goto_previous_start = {
								["[m"] = "@function.outer",
								["[["] = "@class.outer",
							},
							goto_previous_end = {
								["[M"] = "@function.outer",
								["[]"] = "@class.outer",
							},
						},
						swap = {
							enable = true,
							swap_next = {
								["<leader>a"] = "@parameter.inner",
							},
							swap_previous = {
								["<leader>A"] = "@parameter.inner",
							},
						},
					},
				})
			end, 0)
		end,
	},
}
