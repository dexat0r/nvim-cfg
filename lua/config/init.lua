require("config.default")
require("config.packer")
require("config.remap")
require("config.neovide")
require("config.autocommands")

pcall(require, "config.plugins")
