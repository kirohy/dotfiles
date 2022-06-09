local M = {}

function M.config()
  local nvim_lsp = require('lspconfig')

  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, opts)

  local on_attach = function(_, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())), bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>e', vim.lsp.diagnostic.show_line_diagnostics, bufopts)
    -- vim.keymap.set('n', '<Leader>q', vim.lsp.diagnostic.set_loclist, bufopts)
    vim.keymap.set("n", "<Leader>fm", vim.lsp.buf.formatting, bufopts)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  local servers = { 'clangd', 'pyright' }
  for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  end

  nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        },
      }
    }
  })

  local sumneko_root_path = vim.fn.getenv("HOME").."/.lua-language-server"
  local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  nvim_lsp.sumneko_lua.setup {
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }

  require('ionide').setup{}
end

return M
