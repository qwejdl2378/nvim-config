local config = {
  cmd = { path.concat { vim.fn.stdpath "data", "mason", "bin" } },
  root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
