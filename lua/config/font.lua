local font = {}

local s_guifont = "Hack\\ Nerd\\ Font\\ Mono,Hack\\ Nerd\\ Font"
local s_guifont_size_default = 20
local s_current_guifont_size = s_guifont_size_default

local function SetFont()
    vim.cmd("silent! set guifont=" .. s_guifont .. ":h" .. s_current_guifont_size)
end

function font.AdjustFontSize(size)
    s_current_guifont_size = s_current_guifont_size + size
    SetFont()
end

function font.ResetFontSize()
    s_current_guifont_size = s_guifont_size_default
    SetFont()
end

return font
