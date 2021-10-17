------------------------------- Auto completion ------------------------------

-- local compe = require('compe')
-- compe.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 1;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = true;

--   source = {
--     path = true;
--     buffer = true;
--     nvim_lsp = true;
--   };
-- }
local cmp = require('cmp')
cmp.setup {
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end;
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end;
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  }
}

-- Fix colors
vim.cmd [[
  highlight CmpItemAbbrMatch guifg=#000000
  highlight CmpItemAbbrMatchFuzzy guifg=#000000
]]
