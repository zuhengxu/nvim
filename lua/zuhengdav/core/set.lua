vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- set clipboard to system clipboard
vim.cmd([[
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': ['tmux', 'load-buffer', '-'],
      \      '*': ['tmux', 'load-buffer', '-'],
      \    },
      \   'paste': {
      \      '+': ['tmux', 'save-buffer', '-'],
      \      '*': ['tmux', 'save-buffer', '-'],
      \   },
      \   'cache_enabled': 1,
      \ }
]])

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"
-- vim.opt.updatetime = 50

-- Set colorscheme
vim.o.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- set latex word wrap
-- vim.cmd([[autocmd FileType tex setlocal textwidth=80 wrap]])

-- define the spell file location
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- close quick fix vimtex (open with :copen)
vim.cmd([[let g:vimtex_quickfix_mode=0]])

-- settings for Julia
vim.cmd([[au FileType julia setlocal colorcolumn=93]]) --Highlights column 93 to help maintain the 92 character line limit.

-- reduce notications from ltex-ls while preserving noice lsp_progress implementation
-- see bottom of https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages
vim.diagnostic.config({
	update_in_insert = false,
})
