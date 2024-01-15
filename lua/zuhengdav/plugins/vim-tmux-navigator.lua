return {

    {
        "christoomey/vim-tmux-navigator",
        config = function()
            -- disable the default key mappings
            vim.g.tmux_navigator_no_mappings = 1

            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap('n', '<C-Left>', ':TmuxNavigateLeft<CR>', opts)
            vim.api.nvim_set_keymap('n', '<C-Down>', ':TmuxNavigateDown<CR>', opts)
            vim.api.nvim_set_keymap('n', '<C-Up>', ':TmuxNavigateUp<CR>', opts)
            vim.api.nvim_set_keymap('n', '<C-Right>', ':TmuxNavigateRight<CR>', opts)
        end
    },
}
