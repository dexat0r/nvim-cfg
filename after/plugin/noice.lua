require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    views = {
        notify = {
            timeout = 500,
            -- render = "compact",
            fps = 120,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = -1 })
            end,
        },
        cmdline_popup = {
            position = {
                row = "50%",
                col = "50%",
            },
        },
        cmdline_popupmenu = {
            position = {
                row = "66%",
                col = "50%",
            },
        }
    }
})
