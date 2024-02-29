if (vim.g.neovide) then
    vim.g.neovide_remember_window_size = true
    if (vim.loop.os_uname().sysname ~= "Windows_NT") then
        vim.g.neovide_fullscreen = true
    end

    if (vim.fn.getcwd() == '/') then
        vim.api.nvim_set_current_dir('~')
    end
end
