local options = {
  encoding = "UTF-8",
  fileencoding = "utf-8",

  -- nvim is always nocompatible
  -- nocompatible  = true,
  -- nowrap        = true,
  termguicolors = true,
  ignorecase    = true,
  smartcase     = true,
  cursorline    = true,
  number        = true,
  showmatch     = true,
  softtabstop   = 2,
  shiftwidth    = 2,
  expandtab     = true,
  splitright    = true,
  splitbelow    = true,
  -- https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
  clipboard     = 'unnamedplus',
  -- clipboard+=unnamedplus
  syntax        = "on",

  -- 开启 Folding
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevel = 99,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local woption = {
  -- 打开文件时不折叠
  foldenable = false,
  wrap = false,
}

for k, v in pairs(woption) do
  vim.wo[k] = v
end
