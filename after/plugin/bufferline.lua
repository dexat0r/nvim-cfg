require('bufferline').setup({
    options = {
        separator_style = "thick",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true
            },
        },
        diagnostics = "nvim_lsp"
    }
})

-- move between buffers or tabs
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)

-- close tab
vim.keymap.set("n", "<C-q>", vim.cmd.bd)
vim.keymap.set("n", "<leader>q", ":bd!<cr>", {})
