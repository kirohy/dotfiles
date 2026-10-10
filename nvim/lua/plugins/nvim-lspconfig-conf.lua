return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local group = vim.api.nvim_create_augroup('LspConfig', { clear = true })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = group,
      callback = function(args)
        local nvim_telescope = require('telescope.builtin')
        local bufopts = { silent = true, buf = args.buf }
        vim.keymap.set('n', '<Leader>dp', function()
          vim.diagnostic.jump({ count = -1 })
        end, bufopts)
        vim.keymap.set('n', '<Leader>dn', function()
          vim.diagnostic.jump({ count = 1 })
        end, bufopts)
        vim.keymap.set('n', 'gd', nvim_telescope.lsp_definitions, bufopts)
        vim.keymap.set('n', 'gi', nvim_telescope.lsp_implementations, bufopts)
        vim.keymap.set('n', 'gr', nvim_telescope.lsp_references, bufopts)
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

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.lsp.config('*', { capabilities = capabilities })

    local lua_ls_binary = vim.env.HOME .. '/.lua-language-server/bin/lua-language-server'
    if vim.fn.executable(lua_ls_binary) == 0 then
      lua_ls_binary = 'lua-language-server'
    end

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    local library = vim.api.nvim_get_runtime_file('', true)
    table.insert(library, '${3rd}/luv/library')

    vim.lsp.config('lua_ls', {
      cmd = { lua_ls_binary },
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
            library = library,
          },
        },
      },
    })

    vim.lsp.enable({ 'texlab', 'clangd', 'pyright', 'rust_analyzer', 'lua_ls' })
  end,
}
