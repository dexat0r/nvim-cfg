require("config.default")
require("config.packer")
require("config.remap")
require("config.neovide")
require("config.autocommands")

local plugin_status, _ = pcall(require, "config.plugins")

if not plugin_status then
    vim.print("Can't load plugins")
end
