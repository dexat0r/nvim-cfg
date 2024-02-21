if (vim.g.neovide) then
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_fullscreen = true

    if (vim.fn.getcwd() == '/') then
        vim.api.nvim_set_current_dir('~')
    end
end
