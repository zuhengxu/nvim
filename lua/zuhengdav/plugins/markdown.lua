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
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
}
