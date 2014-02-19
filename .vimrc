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
" git plugin
Bundle 'tpope/vim-fugitive'
" file tree
Bundle 'scrooloose/nerdtree'
" extended javascript syntax
Bundle 'jelera/vim-javascript-syntax'
" javascript indent
Bundle 'vim-scripts/JavaScript-Indent'
" vcs info on gutter
Bundle 'mhinz/vim-signify'
" sass syntax
Bundle 'cakebaker/scss-syntax.vim'
" file finder
Bundle 'kien/ctrlp.vim'
" show tabs when expandtabs is on
"Bundle 'Yggdroot/indentLine'
" syntax checker
Bundle 'scrooloose/syntastic'
" auto brackets
Bundle 'Raimondi/delimitMate'
" mercurial plugin
Bundle 'phleet/vim-mercenary'
" extended statusbar
Bundle 'bling/vim-airline'
" terminal inside vim
Bundle 'rosenfeld/conque-term'
" recursive grep in files
Bundle 'yegappan/grep'
" code completion
"Bundle 'Valloric/YouCompleteMe'
" code completion
Bundle 'Shougo/neocomplcache.vim'

" solarized colorscheme
"Bundle 'altercation/vim-colors-solarized'

" colorscheme scroller
Bundle 'ScrollColors'


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

au BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

set smartcase
set incsearch

set tags=.tags

set t_Co=256
colorscheme Monokai
set laststatus=2
set cursorline

" Mappings

cab W w
cab Q q
cab Wq wq

map <C-n> :tabnew<CR>
map <C-l> :NERDTreeToggle<CR>

" CtrlP options
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|sass-cache|vagrant|librarian|node)|node_modules)$'
 
" Airline options
let g:airline_theme='wombat'


" NeoComplCache settings

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
