-- [[ Lspconfig configuration ]]
-- [[ Setup ]]
-- Define keymaps depending on the open buffer
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code action')

  nmap('gd', vim.lsp.buf.definition, 'Goto definition')
  nmap('gr', require('telescope.builtin').lsp_references, 'Goto references')
  nmap('gI', vim.lsp.buf.implementation, 'Goto implementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type definition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols,
    'Document symbols')
  nmap('<leader>ws',
    require('telescope.builtin').lsp_dynamic_workspace_symbols,
    'Workspace symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover documentation')
  nmap('<c-k>', vim.lsp.buf.signature_help, 'Signature documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, 'Goto declaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder,
    'Workspace add folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder,
    'Workspace remove folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Workspace list folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable the following language servers
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  texlab = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
    build = {
      args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      executable = "latex",
      forwardSearchAfter = false,
      onSave = false
    },
    chktex = {
      onEdit = false,
      onOpenAndSave = false
    },
    diagnosticsDelay = 300,
    formatterLineLength = 80,
    forwardSearch = {
      args = {}
    },
    latexFormatter = "latexindent",
    latexindent = {
      modifyLineBreaks = false
    }
  }
}

-- Setup neodev
require 'neodev'.setup {
  library = { plugins = { 'nvim-dap-ui' }, types = true }
}

-- Setup mason
require 'mason'.setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers)
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require 'lspconfig'[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name]
    }
  end
}

-- Turn on lsp status information
require 'fidget'.setup()

-- vim: ts=2 sts=2 sw=2 et
