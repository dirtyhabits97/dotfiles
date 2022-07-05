------------------------------- Mappings ------------------------------

-- Easier reload
vim.api.nvim_create_user_command(
  'Reload',
  function()
    for name, _ in pairs(package.loaded) do
      if name:match('^core') or name:match('^extensions') then
        package.loaded[name] = nil
      end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify('Nvim coniguration reloaded!', vim.log.levels.INFO)
  end,
  { nargs = 0 }
)

-- Leader key
vim.g.mapleader = " "
