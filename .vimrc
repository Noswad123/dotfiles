let mapleader = " "
syntax on
"Remove Trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


map <leader>s :setlocal spell! spelllang=en_us<CR>

set wildmode=longest,list,full

set incsearch
set nu
set relativenumber
set showcmd
set showmatch
set incsearch
set hlsearch
set exrc
set scrolloff=8
set signcolumn=yes
set colorcolumn=80

" auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'

call plug#end()
