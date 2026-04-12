vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/saghen/blink.cmp'
})

local completion = require 'blink.cmp'

vim.lsp.enable({
    "lua_ls",
    "pyright",
})

-- from kickstart.nvim
completion.setup({
  keymap = {
    preset = 'default',
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true },
})
