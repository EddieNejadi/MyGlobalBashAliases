" set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
" set rtp+=/usr/lib/python3.5/site-packages/powerline/bindings/vim/
let $PYTHONPATH='/usr/lib/python3.5/site-packages'

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
Plugin 'vim-pandoc/vim-pandoc' " Added pandoc intgeration bundles
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc-after'
Plugin 'dhruvasagar/vim-table-mode' " Added table mode for creating table.
Plugin 'Shougo/unite.vim' " Added advanced file browser
Plugin 'Valloric/YouCompleteMe' " Tab complete
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

colorscheme molokai
imap jj <Esc>
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
set relativenumber 
set number 
set spell spelllang=en_us " Added spell checking => Disable :set nospell ; move next misspell ]s ; move previous misspell [s ; suggestion z=  

nnoremap <S-Tab> :bnext<CR>:redraw<CR>:ls<CR>
" nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
set spelllang=en
" set spellfile
set term=screen-256color
set clipboard=unnamedplus " Add clipboad copy and paste in linux by "+ register
