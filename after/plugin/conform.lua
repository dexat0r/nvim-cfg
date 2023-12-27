local slow_format_filetypes = { "javascript" }
require("conform").setup({
    -- formatters_by_ft = {
    --     lua = { "stylua" },
    --     javascript = { "prettierd" }
    -- },
    -- format_on_save = function(bufnr)
    --     if slow_format_filetypes[vim.bo[bufnr].filetype] then
    --         return
    --     end
    --     local function on_format(err)
    --         if err and err:match("timeout$") then
    --             slow_format_filetypes[vim.bo[bufnr].filetype] = true
    --         end
    --     end
    --
    --     return { timeout_ms = 200, lsp_fallback = true }, on_format
    -- end,
    --
    -- format_after_save = function(bufnr)
    --     if not slow_format_filetypes[vim.bo[bufnr].filetype] then
    --         return
    --     end
    --     return { lsp_fallback = true }
    -- end,
})
