vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.nocompatible  = true
vim.o.termguicolors = true
vim.o.ignorecase    = true
vim.o.smartcase     = true
vim.o.cursorline    = true
vim.o.backspace     = 2
vim.o.number        = true
vim.o.nowrap        = true
vim.o.showmatch     = true
vim.o.softtabstop   = 2
vim.o.shiftwidth    = 2
vim.o.expandtab     = true
vim.o.splitright    = true
vim.o.splitbelow    = true

-- vim.o.clipboard+=unnamedplus
vim.g.syntax        = "on"

-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 99
vim.o.nofoldenable = true


