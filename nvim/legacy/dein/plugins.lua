local dein_dir = vim.env.HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
  if not vim.fn.isdirectory(dein_repo_dir) == 1 then
    os.execute('git clone https://github.com/Shougo/dein.vim '..dein_repo_dir)
  end
  vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath
end

if vim.fn['dein#load_state'](dein_dir) == 1 then
  vim.fn['dein#begin'](dein_dir)

  local toml_dir = vim.env.HOME .. '/.config/nvim/dein'
  local toml_base = toml_dir .. '/dein.toml'
  local toml_lazy = toml_dir .. '/dein_lazy.toml'

  vim.fn['dein#load_toml'](toml_base, {lazy = 0})
  vim.fn['dein#load_toml'](toml_lazy, {lazy = 1})
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

if vim.fn['dein#check_install']() ~= 0 then
  vim.fn['dein#install']()
end

local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
  vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
  vim.fn['dein#recache_runtimepath']()
end
