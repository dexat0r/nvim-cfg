local ufo = require('ufo')
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 60 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- UFO Setup ----------------------------
-- Disable folding in dashboard
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dashboard", "terminal" },
    callback = function()
        ufo.detach()
        vim.opt_local.foldenable = false
    end
})

ufo.setup({
    provider_selector = function()
        return { 'treesitter', 'indent' }
    end
})

-----------------------------------------
