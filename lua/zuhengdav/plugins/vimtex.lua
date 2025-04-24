return {
	"lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
	config = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_general_viewer = "zathura"
		vim.g.vimtex_compiler_progname = "latexmk"
        vim.g.vimtex_compiler_latexmk_engines = { ["_"]= '-xelatex' }
        -- vim.g.maplocalleader = " " --configured localleader in set.lua
	end,
}
