local notify_status, notify = pcall(require, "notify")

if not notify_status then
   return
end

vim.notify = notify
