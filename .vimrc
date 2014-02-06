set shell=bash
"let $TMPDIR = $HOME."/.tmp"

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'mhinz/vim-signify'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
"Bundle 'phleet/vim-mercenary'
Bundle 'bling/vim-airline'
Bundle 'rosenfeld/conque-term'
"Bundle 'Valloric/YouCompleteMe'

Bundle 'altercation/vim-colors-solarized'


filetype plugin indent on     " required!

" Custom options
set backupdir=~/.tmp
set noswapfile
set nobackup
set nowritebackup

set nu
set tabstop=4
set shiftwidth=4
set showtabline=1
set autoindent

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

set smartcase
set incsearch

set tags=.tags

set t_Co=256
colorscheme Monokai
set laststatus=2

"let g:solarized_termcolors=256
"colorscheme solarized

map <C-n> :tabnew<CR>
map <C-l> :NERDTreeToggle<CR>

let g:ctrlp_show_hidden = 1
let g:airline_theme='wombat'



