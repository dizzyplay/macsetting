set nu
set encoding=utf-8
set nocompatible
set showmatch
set ruler
syntax enable
if has("syntax")
	syntax on
endif

set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'

Plugin 'tpope/vim-vinegar' " when you type - in your diretory its very useful

Plugin 'Yggdroot/indentLine' " show tab lines

Plugin 'Raimondi/delimitMate' " gualho dat

Plugin 'ctrlp.vim' "serach file
Plugin 'rust-lang/rust.vim'


Plugin 'ervandew/supertab' "javascript autocomplete and snippet is very important supertab
Plugin 'honza/vim-snippets'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}


call vundle#end()            " required
filetype plugin indent on    " required

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"ctrlp set working dir path
let g:ctrlp_working_path_mode='a'

let delimitMate_expand_cr=1
