local M = {}

function M.config()
  vim.o.completeopt = 'menuone,noinsert,noselect'

  require('compe').setup {
    source = {
      path = true,
      nvim_lsp = true,
      luasnip = true,
      buffer = true,
      calc = false,
      nvim_lua = false,
      vsnip = false,
      ultisnips = false,
    },
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col '.'  - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
  		return true
  	else
  		return false
  	end
  end

  local luasnip = require 'luasnip'

  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t '<C-n>'
    elseif luasnip.expand_or_jumpable() then
      return t '<Plug>luasnip-expand-or-jump'
    elseif check_back_space() then
      return t '<Tab>'
    else
      return vim.fn['compe#complete']()
    end
  end

  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t '<C-p>'
    elseif luasnip.jumpable(-1) then
      return t '<Plug>luasnip-jump-prev'
    else
      return t '<S-Tab>'
    end
  end

  vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
  vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
  vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

  vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', { expr = true })
  vim.api.nvim_set_keymap('i', '<C-CR>', 'compe#complete()', { expr = true })
end

return M
