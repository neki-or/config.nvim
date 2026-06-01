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
