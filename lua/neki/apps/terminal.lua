-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- TABS
vim.keymap.set("n", "<M-h>", "gT"               , { desc = "Move to the previous tab" })
vim.keymap.set("n", "<M-j>", "<cmd>tabmove+<CR>", { desc = "Increase tab index position" })
vim.keymap.set("n", "<M-k>", "<cmd>tabmove-<CR>", { desc = "Decrease tab index position" })
vim.keymap.set("n", "<M-l>", "gt"               , { desc = "Move to the next tab" })

-- Set <M-1> ... <M-9> to open buffers by index
for i = 1, 9 do
    local keymap  = string.format("<M-%d>", i)
    local command = string.format("%dgt", i)

    vim.keymap.set("n", keymap, command)
end

-- from nvim kickstart
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- FILES
vim.keymap.set('n', '<C-e>', '<cmd>:Ex<CR>', { desc = 'Open netrw' })