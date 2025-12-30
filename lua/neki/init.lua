require 'neki.set'
require 'neki.remap'
require 'neki.cmd'

if vim.g.vscode then
  require 'neki.apps.vscode'

else
  require 'neki.apps.terminal'

end