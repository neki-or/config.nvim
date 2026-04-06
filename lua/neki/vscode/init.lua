vscode = require('vscode')

vscode_set = function(modes, keycode, vscode_command, kwargs)
    local fun = function() vscode.call(vscode_command) end

    vim.keymap.set(modes, keycode, fun, kwargs)
end

vscode_set_async = function(modes, keycode, vscode_command)
    local fun = function() vscode.action(vscode_command) end

    vim.keymap.set(modes, keycode, fun)
end

require 'neki.vscode.set'
require 'neki.vscode.remap'
require 'neki.cmd'
