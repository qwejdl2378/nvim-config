call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'andymass/vim-matchup'
Plug 'rhysd/git-messenger.vim'
Plug 'neovim/nvim-lspconfig'
" Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
"Plug 'elubow/cql-vim'
Plug 'chr4/nginx.vim'
" Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhartington/formatter.nvim'

call plug#end()

lua require('complete')
lua require('lsp')
lua require('ntree')
lua require('fm')
lua require("treesitter")

colorscheme gruvbox

set nocompatible
set termguicolors " 24位真彩色支持
set ignorecase
set smartcase
set cursorline
set paste
set encoding=UTF-8
set backspace=2
set number
set nowrap
set showmatch                   " 光标遇到括号高亮另一半
set softtabstop=2               " Let backspace delete indent
set shiftwidth=2
set expandtab
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set foldmethod=manual           " manual indent expr syntax diff marker
set clipboard+=unnamedplus      " 打通系统剪贴板
set autoindent "smartindent cindent autoindent

syntax on
"filetype indent on " filetype indent plugin on

" 使用 foldexpr 指定的方式折叠代码
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

let mapleader=","
let g:mkdp_auto_start = 0

set completeopt=menu,menuone,noselect " 用于nvim-cmp
" fzf颜色
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" tab间移动
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
nmap mm <Plug>(git-messenger)

lua <<EOF
  -- 
  function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
EOF

autocmd BufWritePre *.go lua go_org_imports()
"autocmd BufRead,BufWritePre *.sh normal gg=G


