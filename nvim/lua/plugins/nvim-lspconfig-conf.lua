return {
  'neovim/nvim-lspconfig',
  config = function()
    local group = vim.api.nvim_create_augroup('LspConfig', { clear = true })

    vim.api.nvim_create_autocmd('LspProgress', {
      group = group,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local value = args.data.params.value
        if not client or type(value) ~= 'table' or not value.kind then
          return
        end
        vim.api.nvim_echo({ { value.message or '' } }, false, {
          id = 'lsp:' .. client.id .. ':' .. args.data.params.token,
          kind = 'progress',
          title = client.name .. ': ' .. (value.title or ''),
          source = client.name,
          status = value.kind == 'end' and 'success' or 'running',
          percent = value.kind == 'end' and 100 or value.percentage,
        })
      end,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = group,
      callback = function(args)
        local bufopts = { silent = true, buf = args.buf }
        vim.keymap.set('n', '<Leader>dp', function()
          vim.diagnostic.jump({ count = -1 })
        end, bufopts)
        vim.keymap.set('n', '<Leader>dn', function()
          vim.diagnostic.jump({ count = 1 })
        end, bufopts)
        vim.keymap.set('n', 'gd', function()
          require('telescope.builtin').lsp_definitions()
        end, bufopts)
        vim.keymap.set('n', 'gi', function()
          require('telescope.builtin').lsp_implementations()
        end, bufopts)
        vim.keymap.set('n', 'gr', function()
          require('telescope.builtin').lsp_references()
        end, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<Leader>fm', vim.lsp.buf.format, bufopts)
      end,
    })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = group,
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
      end,
    })

    local lua_ls_binary = vim.env.HOME .. '/.lua-language-server/bin/lua-language-server'
    if vim.fn.executable(lua_ls_binary) == 0 then
      lua_ls_binary = 'lua-language-server'
    end

    vim.lsp.config('lua_ls', {
      cmd = { lua_ls_binary },
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = { vim.env.VIMRUNTIME, '${3rd}/luv/library' },
            checkThirdParty = false,
          },
        },
      },
    })

    vim.lsp.enable({ 'texlab', 'clangd', 'pyright', 'rust_analyzer', 'lua_ls' })
  end,
}
