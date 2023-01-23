local M = {}

M.set = function(modes, alias, cmd, desc)
  vim.keymap.set(modes, alias, cmd, { desc = desc })
end

M.cmap = function(alias, cmd)
  vim.api.nvim_set_keymap('c', alias, cmd, {})
end

M.nmap = function(alias, cmd)
  vim.api.nvim_set_keymap('n', alias, cmd, {})
end

M.vmap = function(alias, cmd)
  vim.api.nvim_set_keymap('v', alias, cmd, {})
end

M.inoremap = function(alias, cmd)
  vim.api.nvim_set_keymap('i', alias, cmd, { noremap = true })
end

M.nnoremap = function(alias, cmd)
  vim.api.nvim_set_keymap('n', alias, cmd, { noremap = true })
end

M.command = function(name, f)
  vim.api.nvim_create_user_command(name, f, { nargs = 0 })
end

return M
