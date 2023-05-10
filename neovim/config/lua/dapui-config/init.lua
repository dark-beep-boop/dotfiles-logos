-- [[ NvimDapUi configuration ]]
-- [[ Modules ]]
require 'dapui-config.keymaps'

-- [[ Setup ]]
require 'dapui'.setup()
-- Open and close dapui automatically
local dap, dapui = require 'dap', require 'dapui'
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- vim: ts=2 sts=2 sw=2 et