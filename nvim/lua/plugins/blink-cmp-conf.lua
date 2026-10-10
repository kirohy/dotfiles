return {
  'saghen/blink.cmp',
  version = '1.*',
  event = { 'InsertEnter', 'CmdlineEnter' },
  opts = {
    keymap = {
      preset = 'none',
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-Space>'] = { 'show', 'fallback' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      ['<Tab>'] = {
        'select_next',
        'snippet_forward',
        function(cmp)
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          if col > 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil then
            return cmp.show()
          end
        end,
        'fallback',
      },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    completion = {
      keyword = { range = 'full' },
      list = { selection = { preselect = false, auto_insert = false } },
      accept = {
        auto_brackets = {
          force_allow_filetypes = { 'cpp', 'rust' },
          blocked_filetypes = { 'tex', 'plaintex', 'context', 'haskell', 'purescript', 'sh', 'bash', 'nix', 'helm' },
          semantic_token_resolution = { enabled = false },
        },
      },
      menu = {
        draw = { columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } } },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = { border = 'single', winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu' },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
      per_filetype = { lua = { 'lsp' } },
      providers = {
        lsp = { fallbacks = {} },
        buffer = {
          opts = {
            get_bufnrs = function()
              return { vim.api.nvim_get_current_buf() }
            end,
          },
        },
        cmdline = {
          enabled = function()
            local command = vim.fn.getcmdline():match('^%s*(%S+)') or ''
            return command ~= 'Man' and command:sub(1, 1) ~= '!'
          end,
        },
      },
    },
    cmdline = {
      sources = function()
        local command_type = vim.fn.getcmdtype()
        return (command_type == '/' or command_type == '?') and { 'buffer' } or { 'path', 'cmdline' }
      end,
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        menu = { auto_show = true },
      },
    },
    signature = { enabled = true },
    fuzzy = { implementation = 'prefer_rust' },
  },
}
