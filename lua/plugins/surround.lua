vim.pack.add({ {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("4.x"),
} })

-- Disable insert mode <C-g> as it conflits with my own mapping
vim.g.nvim_surround_no_insert_mappings = true

local plugin = require 'nvim-surround'
plugin.setup({
    aliases = {
        ["a"] = ">",
        ["b"] = ")",
        ["g"] = "}",                    -- Modified
        ["q"] = "]",                    -- Modified
        ["v"] = { '"', "'", "`" },      -- Modified
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
})
