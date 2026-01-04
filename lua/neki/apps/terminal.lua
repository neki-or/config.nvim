vim.o.number = true
vim.o.relativenumber = true

-- Show <tab> and trailing spaces
vim.o.list = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- Highlight the line where the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- BUFFERS
vim.keymap.set('n', '<M-h>', 'gT', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<M-l>', 'gt', { desc = 'Move to the next tab' })

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