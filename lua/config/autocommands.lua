local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufEnter" }, {
    pattern = { "" },
    callback = function(args)
        local buf_ft = vim.bo.filetype
        local win_width = vim.api.nvim_win_get_width(0);
        local buf_name = vim.api.nvim_buf_get_name(args.buf)

        if buf_ft == "neoterm" then
            vim.cmd [[
        resize 30
        set nobuflisted
        ]]
        end

        if (buf_ft == "" or buf_ft == nil) and buf_name == '' then
            vim.cmd [[nnoremap <silent> <buffer> q :close<CR>set nobuflisted]]
        end

        -- if (win_width < 10) then
        --     vim.cmd [[ vertical resize 40 ]]
        -- end
    end,
})

autocmd({ "BufLeave" }, {
    callback = function()
        local buf_ft = vim.bo.filetype
        if buf_ft == "neoterm" then
            vim.cmd [[
                resize 10
            ]]
        end
    end

})

autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

autocmd('WinEnter', {
    callback = function()
        -- vim.opt.equalalways = false
        -- -- vim.opt.winfixheight = true
        -- vim.opt.winfixwidth = true
    end
})
