if vim.g.vscode then
    require 'neki.vscode'

else
    require 'neki.set'
    require 'neki.remap'
    require 'neki.cmd'

end
