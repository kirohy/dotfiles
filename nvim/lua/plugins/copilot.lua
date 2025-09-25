return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    -- local command = string.format("zsh -c 'source %s/nvm.sh && nvm version default'", vim.fn.expand("$HOME/.nvm"))
    -- local node_version = vim.fn.trim(vim.fn.system(command))
    -- local node_executable_path = vim.fn.expand("~/.nvm/versions/node/") .. node_version .. "/bin/node"
    local get_latest_version_cmd = 'ls ' .. vim.fn.expand('~/.nvm/versions/node') .. ' | sort -V | tail -n 1'
    local latest_version = vim.fn.trim(vim.fn.system(get_latest_version_cmd))
    local node_executable_path = vim.fn.expand('~/.nvm/versions/node/') .. latest_version .. '/bin/node'
    require('copilot').setup({
      copilot_node_command = node_executable_path,
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
}
