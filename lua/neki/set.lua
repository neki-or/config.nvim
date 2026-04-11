-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.darwin = vim.fn.has('macunix') == 1

vim.o.number = true
vim.o.relativenumber = true

vim.o.cursorline = true
vim.o.scrolloff = 10

-- Highlight trailing and blank characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = 'split'
vim.g.have_nerd_font = false -- TODO: Install a Nerd font

vim.o.wrap = false
vim.o.confirm = true

-- Set tabs as 4 spaces
vim.o.expandtab = true
vim.o.shiftwidth = 4

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.undodir = "/tmp/nvim/undo//"
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.opt.wildmode = { "noselect:lastused", "full" }
vim.opt.wildoptions = "pum"

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
