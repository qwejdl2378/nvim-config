-- Set up nvim-cmp.
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
local cmp_types = require('cmp.types.cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = {
     -- scrolloff = 3,
     -- col_offset = 0,
     -- side_padding = 2,
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    --['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
    --['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp_types.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp_types.SelectBehavior.Insert }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_next_item()),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_prev_item()),
    ['<Tab>'] = { -- see GH-880, GH-897
      i = function(fallback) -- see GH-231, GH-286
        if cmp.visible() then cmp.select_next_item()
        elseif has_words_before() then cmp.complete()
        else fallback() end
      end,
    },
    ['<S-Tab>'] = {
      i = function(fallback)
        if cmp.visible() then cmp.select_prev_item()
        else fallback() end
      end,
    },
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
