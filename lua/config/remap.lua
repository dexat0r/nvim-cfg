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

vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")

vim.keymap.set("n", "<C-->", function()
    font.AdjustFontSize(-1)
end)
vim.keymap.set("n", "<C-+>", function()
    font.AdjustFontSize(1)
end, { noremap = true })
vim.keymap.set("n", "<leader>r", function()
    font.ResetFontSize()
end)
vim.keymap.set("n", "<C-n>", ":enew<cr>")

if vim.g.neovide then
    vim.keymap.set('n', '<D-s>', ':w<CR>')                          -- Save
    vim.keymap.set('v', '<D-c>', '"+y')                             -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')                             -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')                             -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')                          -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')                     -- Paste insert mode
    vim.keymap.set('t', '<D-v>', '<C-\\><C-n>"+Pi')                 -- Paste terminal mode

    vim.keymap.set('n', '<C-s>', ':w<CR>')                          -- Save windows
    vim.keymap.set('v', '<A-c>', '"+y')                             -- Copy windows
    vim.keymap.set('n', '<A-p>', '"+P')                             -- Paste normal mode windows
    vim.keymap.set('v', '<A-p>', '"+P')                             -- Paste visual mode windows
    vim.keymap.set('c', '<A-p>', '<C-R>+')                          -- Paste command mode windows
    vim.keymap.set('i', '<A-p>', '<ESC>l"+Pli', { noremap = true }) -- Paste insert mode windows
    vim.keymap.set('t', '<A-p>', '<C-\\><C-n>"+Pi')                 -- Paste terminal mode windows

    vim.keymap.set('n', '<D-l>', function()
        vim.cmd("vertical resize +1")
    end, { noremap = true })

    vim.keymap.set('n', '<D-h>', function()
        vim.cmd("vertical resize -1")
    end)

    vim.keymap.set('n', '<D-j>', function()
        vim.cmd("resize +1")
    end)

    vim.keymap.set('n', '<D-k>', function()
        vim.cmd("resize -1")
    end)
end

vim.keymap.set('n', '<C-l>', function()
    vim.cmd("vertical resize +1")
end, { noremap = true })

vim.keymap.set('n', '<C-h>', function()
    vim.cmd("vertical resize -1")
end)

vim.keymap.set('n', '<C-j>', function()
    vim.cmd("resize +1")
end)

vim.keymap.set('n', '<C-k>', function()
    vim.cmd("resize -1")
end)

local function vim_opt_toggle(opt, on, off, name)
    local message = name
    if vim.opt[opt]:get() == off then
        vim.opt[opt] = on
        message = message .. " Enabled"
    else
        vim.opt[opt] = off
        message = message .. " Disabled"
    end
    vim.notify(message, "info", {
        render = "compact"
    })
end

vim.keymap.set('n', '<leader>S', function()
    vim_opt_toggle("spell", true, false, "Spelling")
    vim.cmd('syntax off')
    vim.cmd("TSToggle highlight")
end)

vim.keymap.set('n', '<leader>Q', function()
    vim.cmd("BufferLineCloseOthers")
    vim.cmd("bd")
end)
