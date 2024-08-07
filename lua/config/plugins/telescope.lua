local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

require("telescope").setup(
    {
        defaults = {
            layout_strategy = 'vertical',
            layout_config = {
                width = 90,
                height = 40,
                preview_cutoff = 0
            }
        }
    }
)

require("telescope").load_extension "file_browser"
