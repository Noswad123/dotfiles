
let mapleader=" "
syntax on
"Remove Trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

map <leader>s :setlocal spell! spelllang=en_us<CR>

set wildmode=longest,list,full

set number relativenumber
set showcmd
set showmatch
set incsearch
set hlsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'

call plug#end()
