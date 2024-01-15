return {
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	priority = 1000,
	-- 	name = "onedark",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			-- Main options --
	-- 			style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	-- 			transparent = false, -- Show/hide background
	-- 			term_colors = true, -- Change terminal color as per the selected theme style
	-- 			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	-- 			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
	--
	-- 			-- toggle theme style ---
	-- 			toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	-- 			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
	--
	-- 			-- Change code style ---
	-- 			-- Options are italic, bold, underline, none
	-- 			-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	-- 			code_style = {
	-- 				comments = "italic",
	-- 				keywords = "italic",
	-- 				functions = "bold",
	-- 				strings = "none",
	-- 				variables = "none",
	-- 			},
	--
	-- 			-- Custom Highlights --
	-- 			colors = {}, -- Override default colors
	-- 			highlights = {}, -- Override highlight groups
	--
	-- 			-- Plugins Config --
	-- 			diagnostics = {
	-- 				darker = true, -- darker colors for diagnostic
	-- 				undercurl = true, -- use undercurl instead of underline for diagnostics
	-- 				background = false, -- use background color for virtual text
	-- 			},
	-- 		})
	--
	-- 		-- load the colorscheme here
	-- 		vim.cmd.colorscheme("onedark")
	-- 	end,
	-- },
	--
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		-- Default options:
	-- 		require("gruvbox").setup({
	-- 			terminal_colors = true, -- add neovim terminal colors
	-- 			undercurl = true,
	-- 			underline = true,
	-- 			bold = true,
	-- 			italic = {
	-- 				strings = true,
	-- 				emphasis = true,
	-- 				comments = true,
	-- 				operators = false,
	-- 				folds = true,
	-- 			},
	-- 			strikethrough = true,
	-- 			invert_selection = false,
	-- 			invert_signs = false,
	-- 			invert_tabline = false,
	-- 			invert_intend_guides = false,
	-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 			contrast = "", -- can be "hard", "soft" or empty string
	-- 			palette_overrides = {},
	-- 			overrides = {},
	-- 			dim_inactive = false,
	-- 			transparent_mode = false,
	-- 		})
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },

	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				-- -- Main options --
				-- NOTE: to use the light theme, set `vim.o.background = 'light'`
				style = "vulgaris", -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
				toggle_style_key = "<leader>ts", -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
				toggle_style_list = { "vulgaris", "multiplex", "light" }, -- List of styles to toggle between
				transparent = false, -- Show/hide background
				dim_inactive = false, -- Dim inactive windows/buffers
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = "italic",
					conditionals = "italic",
					keywords = "none",
					functions = "none",
					namespaces = "italic",
					parameters = "italic",
					strings = "none",
					variables = "none",
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = false, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = true, -- use background color for virtual text
				},
			})
			require("bamboo").load()
			vim.cmd("colorscheme bamboo")
		end,
	},
}
