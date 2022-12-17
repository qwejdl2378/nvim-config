local conf = require("lsp.settings")

require('lspconfig')['tsserver'].setup {
  on_attach = conf.on_attach,
  flags = conf.lsp_flags,
  capabilities = conf.capabilities
}


