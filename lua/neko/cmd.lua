-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Command line autocompletion -> https://neovim.io/doc/user/cmdline/#cmdline-autocompletion
vim.api.nvim_create_autocmd("CmdlineChanged", {
    pattern = { ":", "/", "?" },
    callback = function()
        vim.fn.wildtrigger()
    end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {       -- Limit shown completion suggestions to 30
    callback = function()
        vim.opt.pumheight = 30
    end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {       -- Reset limit (is global for all popup menus)
    callback = function()
        vim.opt.pumheight = 0
    end,
})

-- Automatically open quickfix list after post
QuickFixOpened = false
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    callback = function()
        QuickFixOpened = true
        vim.cmd("copen")
    end,
})

-- Toggle quickfix list
vim.api.nvim_create_user_command("ToggleQuickFixList", function()
    if QuickFixOpened then
        QuickFixOpened = false
        vim.cmd("cclose")
    else
        QuickFixOpened = true
        vim.cmd("copen")
    end
end, {})

