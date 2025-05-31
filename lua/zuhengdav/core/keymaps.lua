-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- jump back to lua
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- //: clear search
vim.keymap.set("n", "//", "<esc>:noh<cr>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- from theprimeagen
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- using handy way to get into normal mode in nvim terminal
vim.keymap.set("t", [[<C-\>]], [[<C-\><C-n>]])

-- greatest remap ever: in visual mode, use <leader>p to copy to sys clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : yank to system slipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- remap Ctrl-c to Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- never press Q
vim.keymap.set("n", "Q", "<nop>")

-- uncomment the line below after installing tmux
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>:silent !tmux new-window<CR>")
vim.keymap.set("n", "<leader>fv", "<cmd>:silent !tmux split-window -v<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>:silent !tmux split-window -h<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/zuheng/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

---------
-- windows and tab commands
---------
-- jump between windows
vim.keymap.set("n", "<C-right>", "<C-w>l")
vim.keymap.set("n", "<C-left>", "<C-w>h")
vim.keymap.set("n", "<C-up>", "<C-w>k")
vim.keymap.set("n", "<C-down>", "<C-w>j")

--- jumping between todo list
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords
--
-- vim.keymap.set("n", "]t", function()
-- 	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
-- end, { desc = "Next error/warning todo comment" })
--




-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

