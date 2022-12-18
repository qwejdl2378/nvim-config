local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","

keymap("n", "<C-J>", "<C-W>j", opts)
keymap("n", "<C-K>", "<C-W>k", opts)
keymap("n", "<C-L>", "<C-W>l", opts)
keymap("n", "<C-H>", "<C-W>h", opts)

keymap("n", "<C-z>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-x>", ":BufferClose<CR>", opts)
keymap("n", "<leader>r", ":so $MYVIMRC<CR>", { noremap = true })
keymap("n", "<leader><CR>", ":luafile $MYVIMRC<CR>", { noremap = true })
keymap("n", "<leader><Space>", ":luafile %<CR>", { noremap = true })
keymap('n', '<leader>f', ':Files<CR>', opts)
-- tabs快捷键
-- Move to previous/next
keymap('n', '<leader>p', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<leader>n', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
