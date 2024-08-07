require("luasnip.loaders.from_vscode").load()
require("neodev").setup()
local lsp = require('lsp-zero').preset({})
local navic = require('nvim-navic')
local lspconfig = require('lspconfig')
local n = require('config.notify')

-- LSP Zero Setup -----------------------
-- mason for downloading lsp servers;
-- mason-lspconfig for configuring downloaded servers;
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'tsserver',
        'jsonls',
        'lua_ls',
        'omnisharp',
        'emmet_language_server',
        'ltex'
    },
    handlers = {
        lsp.default_setup,
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
                on_attach = function() n.notify { "Lua Lsp attached" } end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
        end,
        ["tsserver"] = function()
            local api = require("typescript-tools.api")
            require("typescript-tools").setup {
                on_attach = function() n.notify { "Typescript Lsp attached" } end,
                settings = {
                    separate_diagnostic_server = false,
                    -- publish_diagnostic_on = "change",
                    tsserver_locale = "ru",
                    complete_function_calls = true,
                    include_completions_with_insert_text = true,
                    code_lense = true
                },
                handlers = {
                    ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
                    -- Ignore 'This may be converted to an async function' diagnostics.
                        { 80003 }
                    )
                }
            }
        end,
        ["jsonls"] = function()
            lspconfig.jsonls.setup {
                on_attach = function()
                    n.notify { "JSON Lsp attached" }
                end
            }
        end,
        ["omnisharp"] = function()
            lspconfig.omnisharp.setup {
                on_attach = function()
                    n.notify { "CSharp Lsp attached!" }
                end,
                handlers = { ['textDocument/definition'] = require('omnisharp_extended').handler }
            }
        end,
        ["emmet_language_server"] = function()
            lspconfig.emmet_language_server.setup({
                on_attach = function()
                    n.notify { "Emmet attached!" }
                end,
                filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
                -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                -- **Note:** only the options listed in the table are supported.
                init_options = {
                    ---@type table<string, string>
                    includeLanguages = {},
                    --- @type string[]
                    excludeLanguages = {},
                    --- @type string[]
                    extensionsPath = {},
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                    preferences = {},
                    --- @type boolean Defaults to `true`
                    showAbbreviationSuggestions = true,
                    --- @type "always" | "never" Defaults to `"always"`
                    showExpandedAbbreviation = "always",
                    --- @type boolean Defaults to `false`
                    showSuggestionsAsSnippets = false,
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                    syntaxProfiles = {},
                    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                    variables = {},
                }
            })
        end,
        ["ltex"] = function()
            lspconfig.ltex.setup({
                on_attach = function()
                    n.notify { "Spell checker attached!" }
                end,
            })
        end
    }
})

-- setup default settings on opened buffer
lsp.on_attach(function(client, bufnr)
    -- set default key bindings
    lsp.default_keymaps({ buffer = bufnr })
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end)

-- setup folding
lsp.set_server_config({
    capabilities = {
        textDocument = {
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
        }
    }
})

-- setup lsp icons
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.setup()
