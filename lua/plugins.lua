return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- 主题色
  use 'morhetz/gruvbox'

  use { 'junegunn/fzf', run = ":fzf#install()" }
  use { 'junegunn/fzf.vim' }

  -- 补全
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  -- 文件树
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  use 'rhysd/git-messenger.vim'
  use 'numToStr/Comment.nvim'
  -- tab管理
  use 'romgrk/barbar.nvim'

  -- 语法解析
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = { ":TSUpdate " } }

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- use 'SirVer/ultisnips'
  -- 字符查找
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'

  use 'jremmen/vim-ripgrep'
  use 'tpope/vim-fugitive'

  -- lsp管理
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'


end)
