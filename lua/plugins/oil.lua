vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

local plugin = require 'oil'

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

plugin.setup({
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  win_options = {
    winbar = "%!v:lua.get_oil_winbar()",
  },
  skip_confirm_for_simple_edits = false,
  use_default_keymaps = false,
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-o>"] = { "actions.select", opts = { horizontal = true } },     -- Modified
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-r>"] = "actions.refresh",                                      -- Modified
    -- ["-"] = { "actions.parent", mode = "n" },
    ["gc"] = { "actions.open_cwd", mode = "n" },                        -- Modified
    -- ["`"] = { "actions.cd", mode = "n" },
    ["g."] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },    -- Modified
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["gh"] = { "actions.toggle_hidden", mode = "n" },                   -- Modified
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  view_options = {
    show_hidden = true,
  }
})
