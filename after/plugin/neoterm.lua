vim.g.neoterm_callbacks = {
    before_create_window = function()
        -- require('config.notify').notify({ "1234" })
        -- vim.cmd [[echo bufnr('%')]]
        vim.cmd [[echo bufnr('%')]]
    end,
    before_new = function()
        require('config.notify').notify({ "123" })
        -- vim.cmd [[echo bufnr('%')]]
        -- vim.cmd [[bd!]]
    end,
    before_exec = function()
        -- vim.cmd [[echo bufnr('%')]]
        -- vim.cmd [[bd!]]
        vim.cmd [[echo bufnr('%')]]
    end,
    after_repl_exec = function()
        vim.cmd [[echo bufnr('%')]]
    end
}

vim.g.neoterm_autoinsert = true
