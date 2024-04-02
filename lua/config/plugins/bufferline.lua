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

local status_bufdelete = pcall(require, "bufdelete")

if (status_bufdelete) then
    vim.keymap.set("n", "<C-q>", ":Bdelete<cr>")
    vim.keymap.set("n", "<leader>q", ":Bdelete!<cr>")
else
    vim.keymap.set("n", "<C-q>", vim.cmd.bd)
    vim.keymap.set("n", "<leader>q", ":bd!<cr>", {})
end

vim.keymap.set("n", "C-Q", ":q<cr>")

-- move between buffers or tabs
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)
