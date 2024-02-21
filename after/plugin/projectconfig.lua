
local status_ok, projectconfig = pcall(require, "nvim-projectconfig")
if (status_ok == nil) then
    return
end

projectconfig.setup({})
