return {

	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		ft = "markdown",
		config = function()
			require("glow").setup({
				border = "shadow",
				-- style = "dark",
				width = 180,
			})
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_close = 0

			-- Set up an autocmd event to apply the key mapping for markdown files
			vim.cmd([[
              autocmd FileType markdown nnoremap <buffer> <leader>ll :MarkdownPreview<CR>
              autocmd FileType markdown nnoremap <buffer> <leader>lc :MarkdownPreviewStep<CR>
              autocmd FileType markdown nnoremap <buffer> <leader>lt :MarkdownPreviewToggle<CR>
            ]])
		end,
	},
}
