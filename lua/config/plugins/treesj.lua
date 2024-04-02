local tsj_utils = require('treesj.langs.utils')
local cpp = require('treesj.langs.cpp')

require('treesj').setup {
    langs = {
        c_sharp = tsj_utils.merge_preset(cpp, {})
    }
}
