vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/saghen/blink.cmp'
})

vim.lsp.enable({
    "lua_ls",
    "pyrefly",
    "rust_analyzer",
})

local mason = require 'mason'
mason.setup()

-- from kickstart.nvim
local completion = require 'blink.cmp'
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
