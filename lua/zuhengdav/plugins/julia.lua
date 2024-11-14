return {
	{
		"JuliaEditorSupport/julia-vim",
		lazy = false,
		config = function()
			vim.g.latex_to_unicode_tab = "on"
			vim.g.latex_to_unicode_auto = 0
		end,
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
				"<localleader>fj",
				":JuliaFormatterFormat<CR>",
				{ noremap = true, silent = true }
			)
			-- Visual mode mapping
			vim.api.nvim_set_keymap(
				"v",
				"<localleader>fj",
				":JuliaFormatterFormat<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
