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

-- SET
-- Mimic the same settings in terminal.lua when a corresponding one exists and isn't default already
vscode.update_config("editor.cursorSurroundingLines", 10, "global")
vscode.update_config("editor.renderWhitespace", "trailing", "global")
vscode.update_config("editor.wordWrap", "off", "global")
vscode.update_config("editor.tabSize", 4, "global")

-- REMAP
-- Use vscode actions instead of 'gt' and 'gT' since they can't be mapped
vscode_set("n", "<M-h>", "workbench.action.previousEditor"        , { desc = "Move to the previous tab" })
vscode_set("n", "<M-j>", "workbench.action.moveEditorRightInGroup", { desc = "Increase tab index position" })
vscode_set("n", "<M-k>", "workbench.action.moveEditorLeftInGroup" , { desc = "Decrease tab index position" })
vscode_set("n", "<M-l>", "workbench.action.nextEditor"            , { desc = "Move to the next tab" })

-- Set <M-1> ... <M-9> to open buffers by index
-- Default VSCode behaviour

-- from nvim kickstart
vscode_set("n", "<C-h>", "workbench.action.focusLeftGroup" , { desc = "Move focus to the left window" })
vscode_set("n", "<C-j>", "workbench.action.focusBelowGroup", { desc = "Move focus to the lower window" })
vscode_set("n", "<C-k>", "workbench.action.focusAboveGroup", { desc = "Move focus to the upper window" })
vscode_set("n", "<C-l>", "workbench.action.focusRightGroup", { desc = "Move focus to the right window" })

vscode_set("n", "<leader>e", "workbench.files.action.focusFilesExplorer", { desc = "Open file manager" })
vscode_set("n", "<leader>t", "workbench.action.createTerminalEditor"    , { desc = "Open terminal mode" })