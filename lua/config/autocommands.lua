local autocmd = vim.api.nvim_create_autocmd

autocmd('TermOpen', {
    callback = function()
        local bufer_options = vim.bo[vim.api.nvim_get_current_buf()]
        local window_options = vim.wo[vim.api.nvim_get_current_win()]
        bufer_options.buflisted = false
        window_options.winfixheight = true
    end
})

autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

autocmd('BufEnter', {
    pattern = { '*.js', '*.ts' },
    callback = function()
        vim.keymap.set('n', '<F5>', function()
            vim.cmd [[TSToolsAddMissingImports]]
        end)
        vim.keymap.set('n', '<F6>', function()
            vim.cmd [[TSToolsRemoveUnusedImports]]
        end)
    end
})

autocmd({ 'BufAdd', 'VimEnter' }, {
    pattern = '*',
    callback = function()
        local buff_listed = vim.fn.getbufinfo({ buflisted = 1 })
        if #buff_listed > 1 then
            vim.opt.showtabline = 2
        end
    end
})

autocmd({'BufDelete'}, {
    pattern = '*',
    callback = function()
        local buff_listed = vim.fn.getbufinfo({ buflisted = 1 })
        if #buff_listed - 1 < 2 then
            vim.opt.showtabline = 0
        end
    end
})
