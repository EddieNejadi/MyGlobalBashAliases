" set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on
Plugin 'powerline/powerline'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'eagletmt/neco-ghc'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'shougo/vimproc.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'flazz/vim-colorschemes'
colorscheme molokai
imap jj <Esc>
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
set relativenumber 
set number 
