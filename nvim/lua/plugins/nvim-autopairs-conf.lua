return {
  'windwp/nvim-autopairs',
  dependencies = { 'hrsh7th/nvim-cmp' },
  event = { 'InsertEnter' },
  config = function ()
    require('nvim-autopairs').setup({
      check_ts = true,
      enable_check_bracket_line = true,
      map_cr = true,
      map_complete = true,
    })
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
  end,
}

