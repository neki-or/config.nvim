vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons'
})

local plugin = require 'lualine'
plugin.setup({
    options = {
        disabled_filetypes = { "no-neck-pain" },
    },
})

vim.opt.showmode = false
