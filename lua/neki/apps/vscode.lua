local vscode = require('vscode')

local vscode_set = function(modes, keycode, vscode_command, kwargs)
    local fun = function() vscode.call(vscode_command) end

    vim.keymap.set(modes, keycode, fun, kwargs)
end

local vscode_set_async = function(modes, keycode, vscode_command)
    local fun = function() vscode.action(vscode_command) end

    vim.keymap.set(modes, keycode, fun)
end

local vscode_stdpath = function()
    local config_dir = vim.g.darwin and "/Library/Application Support" or "/.config"

    return os.getenv("HOME") .. config_dir .. "/Code"
end

vim.notify = vscode.notify

-- SET
-- Symlink settings.json and keybindings.json
vim.fn.system({
    "ln", "-sf",
    vim.fn.stdpath('config') .. "/lua/neki/apps/vscode-settings.jsonc",
    vscode_stdpath()         .. "/User/settings.json"
})
vim.fn.system({
    "ln", "-sf",
    vim.fn.stdpath('config') .. "/lua/neki/apps/vscode-keybindings.jsonc",
    vscode_stdpath()         .. "/User/keybindings.json"
})
-- MACOS: Needed to hold hjkl and have the cursor move
if vim.g.darwin then
    vim.fn.system({
        "defaults", "write", "com.microsoft.VSCode", "ApplePressAndHoldEnabled", "-bool", "false"
    })
end

-- REMAP
-- Use vscode actions instead of 'gt' and 'gT' since they can't be mapped
vscode_set("n", "<M-h>", "workbench.action.previousEditor"        , { desc = "Move to the previous tab" })
vscode_set("n", "<M-j>", "workbench.action.moveEditorRightInGroup", { desc = "Increase tab index position" })
vscode_set("n", "<M-k>", "workbench.action.moveEditorLeftInGroup" , { desc = "Decrease tab index position" })
vscode_set("n", "<M-l>", "workbench.action.nextEditor"            , { desc = "Move to the next tab" })

-- Set <M-6> ... <M-0> to open buffers indexed 1 ... 5
for i = 1, 5 do
    local keymap  = string.format("<M-%d>", (i + 5) % 10)
    local command = string.format("workbench.action.openEditorAtIndex%d", i)

    vscode_set("n", keymap, command)
end

-- from nvim kickstart
vscode_set("n", "<C-h>", "workbench.action.focusLeftGroup" , { desc = "Move focus to the left window" })
vscode_set("n", "<C-j>", "workbench.action.focusBelowGroup", { desc = "Move focus to the lower window" })
vscode_set("n", "<C-k>", "workbench.action.focusAboveGroup", { desc = "Move focus to the upper window" })
vscode_set("n", "<C-l>", "workbench.action.focusRightGroup", { desc = "Move focus to the right window" })

vscode_set("n", "<leader>e", "workbench.files.action.focusFilesExplorer", { desc = "Open file manager" })
vscode_set("n", "<leader>t", "workbench.action.createTerminalEditor"    , { desc = "Open terminal mode" })