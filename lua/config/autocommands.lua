local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    
    if buf_ft == "neoterm" then
        vim.cmd[[
        resize 30
        set nobuflisted
        ]]
    end


    if buf_ft == "" or buf_ft == nil or buf_ft == "neoterm" then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
    ]]
    end
  end,
})

autocmd({ "BufLeave" }, {
    callback = function ()
        local buf_ft = vim.bo.filetype
        if buf_ft == "neoterm" then
            vim.cmd[[
                resize 10
            ]]
        end 
    end

})
