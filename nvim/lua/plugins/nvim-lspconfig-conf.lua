local M = {}

function M.config()
  local nvim_lsp = require('lspconfig')

  vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, { noremap=true, silent=true })
  vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, { noremap=true, silent=true })

  local on_attach = function(_, bufnr)
    local bufopts = { noremap=true, silent=true }
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
    -- buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', bufopts)
    -- buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', bufopts)
    -- buf_set_keymap('n', '<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders())), bufopts)
    buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
    buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
    buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
    buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', bufopts)
    -- buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', bufopts)
    buf_set_keymap('n', '<Leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)

    vim.api.nvim_create_autocmd(
      { 'CursorHold', 'CursorHoldI' },
      {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
            border = 'single',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
          }
          vim.diagnostic.open_float(nil, opts)
        end
      })
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local servers = { 'clangd', 'pyright', 'texlab' }
  for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  end

  nvim_lsp.rust_analyzer.setup {
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
  }

  local lua_ls_root_path = vim.fn.getenv("HOME").."/.lua-language-server"
  local lua_ls_binary = lua_ls_root_path .. '/bin/lua-language-server'

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  nvim_lsp.lua_ls.setup {
    cmd = { lua_ls_binary },
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
end

return M
