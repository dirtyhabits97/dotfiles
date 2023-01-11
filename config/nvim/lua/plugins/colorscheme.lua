return {
  {
    "sonph/onehalf",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      -- Solves: https://github.com/folke/lazy.nvim/issues/183
      vim.opt.rtp:append(plugin.dir .. "/vim")

      vim.cmd('colorscheme onehalfdark')

      vim.cmd [[
      if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
        endif
        ]]
    end,
  },
}
