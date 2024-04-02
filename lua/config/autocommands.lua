local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufEnter" }, {
    pattern = { "" },
    callback = function(args)
        local buf_ft = vim.bo.filetype
        local buf_name = vim.api.nvim_buf_get_name(args.buf)

        if buf_ft == "neoterm" then
            vim.cmd [[
        set nobuflisted
        ]]
        end

        if (buf_ft == "" or buf_ft == nil) and buf_name == '[No Name]' then
            vim.cmd [[nnoremap <silent> <buffer> q :close<CR>set nobuflisted]]
        end
    end,
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
