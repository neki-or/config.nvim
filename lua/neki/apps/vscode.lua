local vscode = require('vscode')

vim.notify = vscode.notify

-- local opts = { silent = true }

-- local function vscode(cmd)
--   return function()
--     vim.fn.VSCodeNotify(cmd)
--   end
-- end

-- Disable Neovim UI
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"

-- vim.keymap.set("n", "<leader>sv", vscode("workbench.action.splitEditorRight"), { desc = "split vertical" })
-- vim.keymap.set("n", "<leader>sh", vscode("workbench.action.splitEditorDown"), { desc = "split horizontal" })
-- vim.keymap.set("n", "<leader>sc", vscode("workbench.action.closeActiveEditor"), { desc = "close split" })
