" set rtp+=~/.local/lib/python2.6/site-packages/powerline/bindings/vim/ " dev environment
" set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/
" let $PYTHONPATH='/usr/lib/python3.5/site-packages'
let $PYTHONPATH='/usr/lib/python3/dist-packages'

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
" Plugin 'vim-pandoc/vim-pandoc' " Added pandoc intgeration bundles
" Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'vim-pandoc/vim-pandoc-after'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dhruvasagar/vim-table-mode' " Added table mode for creating table.
Plugin 'Shougo/unite.vim' " Added advanced file browser
" Plugin 'Valloric/YouCompleteMe' " Tab complete
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
" Plugin 'pearofducks/ansible-vim'
Bundle 'chase/vim-ansible-yaml'

map <Leader>n <plug>NERDTreeTabsToggle<CR>
colorscheme molokai
imap jj <Esc>
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
set relativenumber 
set number 
set spell spelllang=en_us " Added spell checking => Disable :set nospell ; move next misspell ]s ; move previous misspell [s ; suggestion z=  
filetype plugin indent on
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 ts=2 sts=2 sw=2 expandtab

nnoremap <S-Tab> :bnext<CR>:redraw<CR>:ls<CR>
" nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
set spelllang=en
" set spellfile
set term=screen-256color
set clipboard=unnamedplus " Add clipboad copy and paste in linux by "+ register
set mouse=a
cnoremap sudow w !sudo tee % >/dev/null
cmap w!! w !sudo tee > /dev/null %
cmap nn set norelativenumber <bar> set nonumber
cmap ny set relativenumber <bar> set number
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
nnoremap <C-W>E <C-W>=
nnoremap <C-W>e <C-W><C-W><C-W>\|<C-W>_ 
" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)

  " autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
  autocmd BufReadPost,FileReadPost *.gpg '[,']!~/MyGlobalBashAliases/gpg.sh --decrypt

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  
  " autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  autocmd BufWritePre,FileWritePre *.gpg '[,']!~/MyGlobalBashAliases/gpg.sh --default-recipient-self -ae
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
