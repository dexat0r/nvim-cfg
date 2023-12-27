vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<S-l>", "<C-w>w")
vim.keymap.set("n", "<S-h>", "<C-w>W")
vim.keymap.set("n", "<leader>c", "<C-w>c");
vim.keymap.set("n", "<leader>o", "<C-w>v");

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-T>", ":rightbelow :Tnew<cr>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("v", "<leader>c", "\"+y")

vim.keymap.set("n", "<leader>t", vim.cmd.Trouble)
