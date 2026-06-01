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
-- vim.o.autowrite = true TODO: check args lists
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
vim.g.have_nerd_font = true
vim.g.netrw_liststyle = 3

-- Fuzzy file picker -> https://neovim.io/doc/user/cmdline/#fuzzy-file-picker
vim.opt.findfunc = "v:lua.Find"
vim.opt.wildmode = { "noselect:lastused", "full" }
vim.opt.wildoptions = "pum"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

filescache = {}
function _G.Find(arg, _)
    if vim.tbl_isempty(filescache) then
        filescache = vim.fn.globpath('.', '**', true, true)

        filescache = vim.tbl_filter(function(path)
            return vim.fn.isdirectory(path) == 0
        end, filescache)

        filescache = vim.tbl_map(function(path)
            return vim.fn.fnamemodify(path, ':.')
        end, filescache)
    end

    if arg == "" then
        return filescache
    end

    return vim.fn.matchfuzzy(filescache, arg)
end

-- References: https://github.com/radleylewis/nvim-lite, kickstart.nvim
