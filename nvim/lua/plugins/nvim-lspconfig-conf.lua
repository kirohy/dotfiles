return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local nvim_lsp = require('lspconfig')

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(_)
        local nvim_telescope = require('telescope.builtin')
        local bufopts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set('n', '<Leader>dp', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set('n', '<Leader>dn', vim.diagnostic.goto_next, bufopts)
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

    local servers = { 'clangd', 'pyright' }
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup({
        capabilities = capabilities,
      })
    end

    nvim_lsp.texlab.setup({
      capabilities = capabilities,
      root_dir = nvim_lsp.util.root_pattern('.git', 'latexmkrc'),
    })

    nvim_lsp.rust_analyzer.setup({
      capabilities = capabilities,
    })

    local lua_ls_root_path = vim.fn.getenv('HOME') .. '/.lua-language-server'
    local lua_ls_binary = lua_ls_root_path .. '/bin/lua-language-server'

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    nvim_lsp.lua_ls.setup({
      cmd = { lua_ls_binary },
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
    })
  end,
}
