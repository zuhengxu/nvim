return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "slant",
			offsets = {
				{
					filetype = "NvimTree",
					highlight = "Directory",
					separator = true, -- use a "true" to enable the default, or set your own character
				},
			},
		},
	},
}
