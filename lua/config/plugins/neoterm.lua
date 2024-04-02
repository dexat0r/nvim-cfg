
vim.g.neoterm_callbacks = {
    before_create_window = function()
    end,
    before_new = function()
end,
    before_exec = function()
    end,
    after_repl_exec = function()
    end
}

vim.g.neoterm_autoinsert = true

vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:bd!<CR>') -- close terminal
