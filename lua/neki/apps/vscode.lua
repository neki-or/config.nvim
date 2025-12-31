local vscode = require('vscode')

local vscode_set = function(modes, keycode, vscode_command, kwargs)
    local fun = function() vscode.call(vscode_command) end

    vim.keymap.set(modes, keycode, fun, kwargs)
end

local vscode_set_async = function(modes, keycode, vscode_command)
    local fun = function() vscode.action(vscode_command) end

    vim.keymap.set(modes, keycode, fun)
end

vim.notify = vscode.notify

-- Disable Neovim UI
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"

-- BUFFERS
-- Use vscode actions instead of 'bnext' and 'bprev' since the nvim extension pollutes the buffer lists
vscode_set("n", "<A-h>", "workbench.action.previousEditor", { desc = 'Move to the previous buffer' })
vscode_set("n", "<A-l>", "workbench.action.nextEditor"    , { desc = 'Move to the next buffer' })

-- from nvim kickstart
vscode_set("n", "<C-h>", "workbench.action.focusLeftGroup" , { desc = "Move focus to the left window" })
vscode_set("n", "<C-j>", "workbench.action.focusBelowGroup", { desc = "Move focus to the lower window" })
vscode_set("n", "<C-k>", "workbench.action.focusAboveGroup", { desc = "Move focus to the upper window" })
vscode_set("n", "<C-l>", "workbench.action.focusRightGroup", { desc = "Move focus to the right window" })
