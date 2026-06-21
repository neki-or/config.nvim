-- Basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 10

-- Indentation
vim.o.shiftwidth = 4
vim.o.softtabstop = -1                      -- Use the same value as shiftwidth
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true                      -- Case sensitive if uppercase in search

-- Visual settings
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.list = true                           -- Highlight trailing and blank characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'nosplit'                -- Preview the effect of commands on the buffer

-- File handling
vim.o.undofile = true
vim.o.undodir = "/tmp/nvim/undo//"          -- Basically clears undo history when PC is shut down
vim.o.updatetime = 250                      -- Decrease update time
vim.o.timeoutlen = 300                      -- Decrease mapped sequence wait time
vim.o.hidden = false
vim.o.autowrite = true
vim.o.confirm = true

-- Behavior settings
vim.schedule(function()                     -- Schedule the setting after `UiEnter` because it can increase startup-time
    vim.o.clipboard = 'unnamedplus'         -- Sync clipboard between OS and Neovim
end)
vim.o.encoding = "UTF-8"

-- Folding settings
vim.o.foldenable = false
vim.o.wrap = false

-- Split behaviour
vim.o.splitbelow = true
vim.o.splitright = true

-- Key settings
vim.g.mapleader = ' '                       -- NOTE: Must happen before plugins are loaded
vim.g.maplocalleader = ' '

-- Other settings
vim.g.darwin = vim.fn.has('macunix') == 1   -- Is this MacOS?
vim.g.netrw_liststyle = 3

-- GUI settings
if not vim.g.darwin then
    vim.g.neovide_scale_factor = 0.8
end
vim.g.have_nerd_font = true
vim.o.guifont = "SauceCodePro Nerd Font Mono:h14"
vim.g.neovide_cursor_animation_length = 0

require 'neko.fuzzyfinder'

-- References: https://github.com/radleylewis/nvim-lite, kickstart.nvim
