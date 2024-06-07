-- [[ codelldb dap adapter ]]

return {
  adapters = { 'codelldb' },
  config = function()
    local dap = require('dap')
    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        -- CHANGE THIS to your path!
        command = '/home/zus/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", "${port}" },
      }
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
          line = vim.fn.input('Arguments: ')
          chunks = {}
          for substring in line:gmatch("%S+") do
            table.insert(chunks, substring)
          end
          return chunks
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
  end,
}

-- vim: ts=2 sts=2 sw=2 et
