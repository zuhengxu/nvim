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
		config = function()
			vim.g.mkdp_auto_close = 0 -- Auto close current preview window when change from markdown buffer to another buffer
			vim.g.mkdp_refresh_slow = 0 -- Refresh preview while editing

			vim.g.mkdp_page_title = "${name}" -- Preview page title

			vim.g.mkdp_theme = "light" -- Set default theme (dark or light)
			vim.g.mkdp_echo_preview_url = 1
			vim.g.mkdp_port = "8080"
			vim.g.mkdp_page_title = "「 Preview 」"
			-- vim.g.mkdp_filetypes = { "markdown", "pandoc", "anki", "text", "txt" }
		end,
	},
}
