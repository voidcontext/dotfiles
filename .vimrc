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
Bundle 'tpope/vim-fugitive' "git plugin
Bundle 'scrooloose/nerdtree' " tree file browser
Bundle 'jelera/vim-javascript-syntax' " extended javascript syntax
Bundle 'vim-scripts/JavaScript-Indent' " javascript indent
Bundle 'mhinz/vim-signify' " show diff signs
Bundle 'cakebaker/scss-syntax.vim' " sass syntax
Bundle 'kien/ctrlp.vim' " search files
Bundle 'Yggdroot/indentLine' " show indents when expandtabs is true
Bundle 'scrooloose/syntastic' " syntax checker
Bundle 'Raimondi/delimitMate' " auto brackets
"Bundle 'phleet/vim-mercenary' " mercurial plugin
Bundle 'bling/vim-airline' " extended statusbar
Bundle 'rosenfeld/conque-term' " terminal
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

" Mappings
map <C-n> :tabnew<CR>
map <C-l> :NERDTreeToggle<CR>

" CtrlP options
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|sass-cache|vagrant|librarian|node)|node_modules)$'
 
" Airline options
let g:airline_theme='wombat'



