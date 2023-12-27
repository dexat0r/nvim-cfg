local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-s>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
        [';'] = cmp.mapping(function(fallback)
            local status_ok, luasnip = pcall(require, "luasnip")
            if status_ok and luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-;>"] = cmp.mapping(function(fallback)
            local status_ok, luasnip = pcall(require, "luasnip")
            if not status_ok then
                return fallback()
            end
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        -- snippets
        { name = 'luasnip' },
        -- lsp suggestions
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'cmd' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    }
})
