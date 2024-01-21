return {
	{
		"JuliaEditorSupport/julia-vim",
		lazy = false,
		config = function()
			vim.g.latex_to_unicode_tab = "off"
			vim.g.latex_to_unicode_auto = 1
		end,
	},
	{
		"andreypopp/julia-repl-vim",
	},
	{
		--formatter
		"kdheepak/JuliaFormatter.vim",
		lazy = false,
		filetypes = { "julia" },
		config = function()
			-- Normal mode mapping
			vim.api.nvim_set_keymap(
				"n",
				"<localleader>ff",
				":JuliaFormatterFormat<CR>",
				{ noremap = true, silent = true }
			)
			-- Visual mode mapping
			vim.api.nvim_set_keymap(
				"v",
				"<localleader>ff",
				":JuliaFormatterFormat<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
