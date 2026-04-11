-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set("n", "<M-h>", "gT"               , { desc = "Move to the previous tab" })
vim.keymap.set("n", "<M-j>", "<cmd>tabmove+<CR>", { desc = "Increase tab index position" })
vim.keymap.set("n", "<M-k>", "<cmd>tabmove-<CR>", { desc = "Decrease tab index position" })
vim.keymap.set("n", "<M-l>", "gt"               , { desc = "Move to the next tab" })

-- Set <M-6> ... <M-0> to open buffers indexed 1 ... 5
for i = 1, 5 do
    local keymap  = string.format("<M-%d>", (i + 5) % 10)
    local command = string.format("%dgt", i)

    vim.keymap.set("n", keymap, command)
end

-- from nvim kickstart
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<leader>e', '<cmd>:Ex<CR>' ,      { desc = 'Open file manager' })
vim.keymap.set('n', '<leader>t', '<cmd>:ter<CR>',      { desc = 'Open terminal mode' })
vim.keymap.set('n', '<leader>f', ':find ',             { desc = 'Find file shortcut' })
vim.keymap.set('n', '<leader>w', '<cmd>:w<CR>',        { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>:q<CR>',        { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>n', '<cmd>:tabnew<CR>',   { desc = 'Create a new tab' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/]])

-- Stay centered
vim.keymap.set("n", "<C-d>", "<C-d>zz0")
vim.keymap.set("n", "<C-u>", "<C-u>zz0")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- ALIAS
-- Same key as _ which is the complementary motion and easier to press than '<S-4>'
vim.keymap.set({"n", "v"}, "-", "$")
