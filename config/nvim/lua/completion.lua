------------------------------- Auto completion ------------------------------

-- Pretty
local lsp_symbols = {
  Text          = '   (Text) ',
  Method        = '   (Method)',
  Function      = '   (Function)',
  Constructor   = '   (Constructor)',
  Field         = ' ﴲ  (Field)',
  Variable      = '[] (Variable)',
  Class         = '   (Class)',
  Interface     = ' ﰮ  (Interface)',
  Module        = '   (Module)',
  Property      = ' 襁 (Property)',
  Unit          = '   (Unit)',
  Value         = '   (Value)',
  Enum          = ' 練 (Enum)',
  Keyword       = '   (Keyword)',
  Snippet       = '   (Snippet)',
  Color         = '   (Color)',
  File          = '   (File)',
  Reference     = '   (Reference)',
  Folder        = '   (Folder)',
  EnumMember    = '   (EnumMember)',
  Constant      = ' ﲀ  (Constant)',
  Struct        = ' ﳤ  (Struct)',
  Event         = '   (Event)',
  Operator      = '   (Operator)',
  TypeParameter = '   (TypeParameter)'
}

local lsp_sources = {
  nvim_lsp = 'LSP',
  buffer   = 'Buffer',
  path     = 'Path',
  vsnip    = 'VSnip'
}

-- Helper
local function t(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

-- Setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available']() == 1 then
        vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)'), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#available']() == 1 then
        vim.fn.feedkeys(t('<Plug>(vsnip-jump-prev)'), '')
      else
        fallback()
      end;
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' }
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lsp_symbols[vim_item.kind]
      vim_item.menu = lsp_sources[entry.source.name]
      return vim_item
    end,
  },
}

-- Fix colors
vim.cmd [[
  highlight CmpItemAbbrMatch guifg=#000000
  highlight CmpItemAbbrMatchFuzzy guifg=#000000
]]
