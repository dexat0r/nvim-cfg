local notifier = {}
function notifier.notify(t)
    vim.notify(t[1], t[2] or "info", {
        timeout = 2000,
        render = "compact",
        stages = "static",
        fps = 120
    })
end

return notifier
