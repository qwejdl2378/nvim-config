local config = {
  cmd = { '/usr/local/mason/bin/jdtls' },
}

require 'lspconfig'.jdtls.setup(config)
-- require('jdtls').start_or_attach(config)
