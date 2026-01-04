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
vim.keymap.set('n', '<A-h>', '<cmd>bprev<CR>', { desc = 'Move to the previous buffer' })
vim.keymap.set('n', '<A-l>', '<cmd>bnext<CR>', { desc = 'Move to the next buffer' })

-- Set <A-1> ... <A-9> to open buffers by index
for i = 1, 9 do
    local keymap  = string.format("<A-%d>", i)
    local command = string.format("<cmd>b%d<CR>", i)

    vim.keymap.set("n", keymap, command)
end

-- from nvim kickstart
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- FILES
vim.keymap.set('n', '<C-e>', '<cmd>:Ex<CR>', { desc = 'Open netrw' })