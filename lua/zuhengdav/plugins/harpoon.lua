return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():append()
		end, { desc = "Mark file with harpoon" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open current harpoon list" })

		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Go to next harpoon mark" })

		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Go to previous harpoon mark" })
	end,
}
