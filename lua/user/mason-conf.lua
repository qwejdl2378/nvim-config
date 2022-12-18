require("mason").setup({
  install_root_dir = "/usr/local/mason",
})

require("mason-lspconfig").setup({
  ensure_installed = { "jdtls" },
  automatic_installation = false,
})
