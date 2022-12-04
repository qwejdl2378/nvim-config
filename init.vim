call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'andymass/vim-matchup'
Plug 'rhysd/git-messenger.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'elubow/cql-vim'
Plug 'chr4/nginx.vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

lua require('lsp')
lua require('ntree')

colorscheme gruvbox

set nocompatible
set paste
set encoding=UTF-8
set backspace=2
set number
set nowrap
set showmatch                   " 光标遇到括号高亮另一半
set softtabstop=4               " Let backspace delete indent
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set foldmethod=manual           " manual indent expr syntax diff marker
set clipboard+=unnamedplus      " 打通系统剪贴板


let mapleader=","

" markdown配置
let g:vim_markdown_folding_disabled = 1
let g:mkdp_auto_start = 0

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


syntax on
" filetype indent plugin on
filetype indent on
set cindent "smartindent cindent autoindent
autocmd BufRead,BufWritePre *.sh normal gg=G

" 补全配置
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap mm <Plug>(git-messenger)
