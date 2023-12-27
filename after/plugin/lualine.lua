require("lualine").setup({
    options = {
        theme = "kanagawa",
    },
    sections = {
        lualine_c = {
            "navic",
            color_correction = nil,
            navi_opts = nil
        },
        lualine_x = {
            {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = { fg = "#ff9e64" },
            }
        },
    },
})

