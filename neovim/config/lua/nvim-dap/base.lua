-- [[ nvim-dap setup ]]

-- Adapters
-- vscode-cpptool adapter
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/opt/ms-vscode.cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
