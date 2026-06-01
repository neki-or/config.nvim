vim.pack.add({ 'https://github.com/shortcuts/no-neck-pain.nvim' })

local plugin = require 'no-neck-pain'

plugin.setup({
    width = 175,
    autocmds = {
        enableOnVimEnter = "safe",
        enableOnTabEnter = true,
        skipEnteringNoNeckPainBuffer = true,
    },
    buffers = {
        scratchPad = { enabled = false },
        wo = {
            fillchars = "eob: ",
        },
    }
})
