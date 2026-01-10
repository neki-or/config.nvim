-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- ALIAS
-- Same key as _ which is the complementary motion and easier to press than '<S-4>'
vim.keymap.set({"n", "v"}, "-", "$")