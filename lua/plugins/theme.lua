vim.pack.add({ 'https://github.com/tiagovla/tokyodark.nvim' })

local theme = require 'tokyodark'
local opts = {
    transparent_background = false, -- set background to transparent
    styles = {
        comments = { italic = false }, -- style for comments
        keywords = { italic = false }, -- style for keywords
        identifiers = { italic = false }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
    },
    custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
    custom_palette = {} or function(palette) return {} end, -- extend palette
    terminal_colors = true, -- enable terminal colors
}

theme.setup(opts)
vim.cmd.colorscheme('tokyodark')
