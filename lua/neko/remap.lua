-- General remaps and shortcuts
vim.keymap.set('n', '<leader>e' , '<cmd>:Oil<CR>'               , { desc = 'Open file manager' })
vim.keymap.set('n', '<leader>t' , '<cmd>:ter<CR>'               , { desc = 'Open terminal mode' })
vim.keymap.set('n', '<leader>f' , ':find '                      , { desc = 'Find file shortcut' })
vim.keymap.set('n', '<leader>w' , '<cmd>:w<CR>'                 , { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>q' , '<cmd>:q<CR>'                 , { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>n' , '<cmd>:tabnew<CR>'            , { desc = 'Create a new tab' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.setqflist      , { desc = 'Open LSP diagnostics quickfix list' })
vim.keymap.set('n', '<leader>d' , vim.diagnostic.open_float     , { desc = 'Open LSP diagnostics float window' })
vim.keymap.set('n', '<leader>x' , '<cmd>:ToggleQuickFixList<CR>', { desc = 'Toggle the quickfix list' })
vim.keymap.set('n', '<leader>j' , '<cmd>:cnext<CR>'             , { desc = 'Navigate quickfix list forward' })
vim.keymap.set('n', '<leader>k' , '<cmd>:cprevious<CR>'         , { desc = 'Navigate quickfix list backwards' })

vim.keymap.set('i', '<C-g>', '{}<Left>')
vim.keymap.set('i', '<C-q>', '[]<Left>')

vim.keymap.set({"n", "v"}, "-", "$")
vim.cmd("cabbrev vgrep vimgrep")

-- Move between tabs
vim.keymap.set("n", "<M-h>", "gT"               , { desc = "Move to the previous tab" })
vim.keymap.set("n", "<M-j>", "<cmd>tabmove+<CR>", { desc = "Increase tab index position" })
vim.keymap.set("n", "<M-k>", "<cmd>tabmove-<CR>", { desc = "Decrease tab index position" })
vim.keymap.set("n", "<M-l>", "gt"               , { desc = "Move to the next tab" })

-- Set <M-6> ... <M-0> to open tabs indexed 1 ... 5
for i = 1, 5 do
    local keymap  = string.format("<M-%d>", (i + 5) % 10)
    local command = string.format("%dgt", i)

    vim.keymap.set("n", keymap, command)
end

-- Move between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/]])

-- Stay centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz0")
vim.keymap.set("n", "<C-u>", "<C-u>zz0")

-- Do not yank replaced text after pasting
vim.keymap.set("x", "p", '"_dP')

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
