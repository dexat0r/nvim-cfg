local font = require("config.font")
print(font.AdjustFontSize(1));

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

vim.keymap.set("n", "<C-->", function ()
	font.AdjustFontSize(-1)
end)
vim.keymap.set("n", "<C-+>", function ()
	font.AdjustFontSize(1)
end, { noremap = true })
vim.keymap.set("n", "<leader>r", function ()
	font.ResetFontSize()
end)

if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set('t', '<D-v>', '<C-\\><C-n>"+Pi') -- Paste terminal mode
end
