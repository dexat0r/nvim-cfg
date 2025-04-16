local autocmd = vim.api.nvim_create_autocmd

autocmd('TermOpen', {
    callback = function()
        local bufer_options = vim.bo[vim.api.nvim_get_current_buf()]
        local window_options = vim.wo[vim.api.nvim_get_current_win()]
        bufer_options.buflisted = false
        window_options.winfixheight = true
    end
})

autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        vim.api.nvim_create_user_command(
            'OpenTodo',
            function()
                local config_dir = vim.fn.stdpath('config')
                local project_name = vim.fn.fnamemodify(vim.loop.cwd(), ":p:h:t")
                local project_todo_dir = config_dir .. '/todos/' .. project_name

                if vim.fn.isdirectory(project_todo_dir) ~= 1 then
                    vim.fn.mkdir(project_todo_dir, 'p')
                end

                local window = vim.api.nvim_open_win(0, true, { split = 'right', width = 40 })
                vim.cmd.edit(project_todo_dir .. '/todo-list')
                local buffer = vim.api.nvim_get_current_buf();
                local bufer_options = vim.bo[buffer]
                local window_options = vim.wo[window]
                bufer_options.buflisted = false
                window_options.winfixwidth = true
                window_options.winfixbuf = true


                local buf_line_count = vim.api.nvim_buf_line_count(buffer)
                local buf_content = vim.api.nvim_buf_get_lines(buffer, 0, buf_line_count, false)

                local HEADER = '--- TODO LIST ---'

                local first_line = unpack(buf_content)

                if first_line ~= HEADER then
                    vim.api.nvim_buf_set_lines(buffer, 0, buf_line_count + 1, false,
                        { HEADER, unpack(buf_content) })
                end

                vim.cmd [[w]]

                autocmd({ 'InsertLeave', 'TextChanged' }, {
                    pattern = { 'todo-list' },
                    callback = function()
                        vim.cmd [[w]]
                    end
                })

                vim.keymap.set('n', 'q', function()
                    vim.cmd.q();
                end, { buffer = true, silent = true })
            end,
            {})
    end
})

autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

autocmd({ 'InsertLeave', 'TextChanged' }, {
    pattern = { '*.rs' },
    callback = function()
        vim.cmd [[w]]
    end
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

autocmd('BufEnter', {
    pattern = { '*.rs' },
    callback = function()
        vim.diagnostic.config({ virtual_lines = false })
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

autocmd({ 'BufDelete' }, {
    pattern = '*',
    callback = function()
        local buff_listed = vim.fn.getbufinfo({ buflisted = 1 })
        if #buff_listed - 1 < 2 then
            vim.opt.showtabline = 0
        end
    end
})
