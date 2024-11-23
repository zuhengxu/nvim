return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = { "InsertEnter", "LspAttach", "BufRead" },
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					bash = true,
					html = true,
					lua = true,
					markdown = true,
					julia = true,
					python = true,
					r = true,
					yaml = true,
					plaintext = false,
					["*"] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"AndreM222/copilot-lualine",
	},
}
