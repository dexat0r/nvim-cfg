vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
    view = {
        width = 45,
        preserve_window_proportions = true
    },
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>f", vim.cmd.NvimTreeFocus)
