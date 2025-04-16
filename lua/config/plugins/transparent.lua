vim.api.nvim_set_hl(0, 'NotifyBackground', vim.api.nvim_get_hl_by_name('Normal', true))
require('transparent').clear_prefix('NvimTree')
require('transparent').clear_prefix('lualine')
require('transparent').clear_prefix('BufferLine')
require('transparent').clear_prefix('Lsp')
require('transparent').setup({
    extra_groups = {
        'MsgArea',
        'CursorLineFold',
        'FoldColumn',
        'ErrorMsg',
        'WarningMsg'
    }
})

