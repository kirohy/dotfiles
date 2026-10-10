local group = vim.api.nvim_create_augroup('CoreUI', { clear = true })

vim.api.nvim_create_autocmd('UIEnter', {
  group = group,
  once = true,
  callback = function()
    -- UI2 is experimental; its internal API may change.
    local ui = require('vim._core.ui2')
    ui.enable({ msg = { targets = 'msg' } })

    -- Keep errors in the message window even while a prompt is active.
    local errors = { emsg = true, echoerr = true, lua_error = true, rpc_error = true }
    local show_message = ui.msg.msg_show
    ui.msg.msg_show = function(kind, content, replace_last, history, append, id, trigger)
      if errors[kind] then
        ui.msg.show_msg('msg', kind, content, replace_last, append, id)
        vim.cmd.redraw()
      else
        show_message(kind, content, replace_last, history, append, id, trigger)
      end
    end
  end,
})
