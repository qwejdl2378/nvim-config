local conf = require("lsp.settings")
local util = require "lspconfig/util"

-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-config
require('lspconfig')['gopls'].setup {
  on_attach = conf.on_attach,
  flags = conf.lsp_flags,
  capabilities = conf.capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}


