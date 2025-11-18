return {

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			-- Define dap mappings here
			vim.api.nvim_set_keymap(
				"n",
				"<leader>db",
				"<cmd>DapToggleBreakpoint<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	-- {
	-- 	"mfussenegger/nvim-dap-python",
	-- 	ft = "python",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"rcarriga/nvim-dap-ui",
	-- 	},
	-- 	config = function(_, opts)
	-- 		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	-- 		require("dap-python").setup(path)

	-- 		-- Define dap-python mappings here
	-- 		vim.api.nvim_set_keymap(
	-- 			"n",
	-- 			"<leader>dpr", -- debug python run
	-- 			'<cmd>lua require("dap-python").test_method()<CR>',
	-- 			{ noremap = true, silent = true }
	-- 		)
	-- 	end,
	-- },
}
