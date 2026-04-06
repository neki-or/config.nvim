vim.notify = vscode.notify

vscode_stdpath = function()
    local config_dir = vim.g.darwin and "/Library/Application Support" or "/.config"

    return os.getenv("HOME") .. config_dir .. "/Code"
end

-- Symlink settings.json and keybindings.json
vim.fn.system({
    "ln", "-sf",
    vim.fn.stdpath('config') .. "/lua/neki/vscode/settings.jsonc",
    vscode_stdpath()         .. "/User/settings.json"
})
vim.fn.system({
    "ln", "-sf",
    vim.fn.stdpath('config') .. "/lua/neki/vscode/keybindings.jsonc",
    vscode_stdpath()         .. "/User/keybindings.json"
})

-- MACOS: Needed to hold hjkl and have the cursor move
if vim.g.darwin then
    vim.fn.system({
        "defaults", "write", "com.microsoft.VSCode", "ApplePressAndHoldEnabled", "-bool", "false"
    })
end
