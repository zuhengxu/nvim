return {
	"jpalardy/vim-slime",
	ft = { "julia", "python", "r" },
	-- init = function()
	-- 	vim.g.slime_no_mappings = 1 -- disable default mappings
	-- end,
	config = function()
		vim.g.slime_target = "tmux"
		-- vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
		vim.g.slime_default_config = { socket_name = "default", target_pane = "{bottom-right}" }

		-- vim.g.slime_default_config = {
		-- 	-- Lua doesn't have a string split function!
		-- 	socket_name = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
		-- 	target_pane = "{top-right}",
		-- }
	end,
}
