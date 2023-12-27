local headers = require("config.dashboard.custom_header")
local db = require('dashboard')

db.setup {
    theme = "doom",
    disable_move = true,
    config = {
        header = headers.billyAsWeCan,
        center = {
            {
                icon = '-> ',
                icon_hl = 'group',
                desc = 'Let\'s rock!',
                desc_hl = 'group',
                key = 'g',
                key_hl = 'group',
                key_format = ' [%s]',
                action = function()
                    vim.cmd [[:Telescope find_files]]
                end,
            },
            {
                icon = '-> ',
                icon_hl = 'group',
                desc = 'Nah, not today',
                desc_hl = 'group',
                key = 'q',
                key_hl = 'group',
                key_format = ' [%s]',
                action = function()
                    vim.cmd [[:qa!]]
                end,
            }
        },
        footer = function()
            return headers.text.footer
        end
    },
}

vim.cmd [[hi DashboardHeader guifg=#5efc03]]
