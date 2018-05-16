syntax on

set shell=bash
"let $TMPDIR = $HOME."/.tmp"

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here
" git plugin
Plugin 'tpope/vim-fugitive'
" file tree
Plugin 'scrooloose/nerdtree'
" nerdtree tabs - not used because of ctrl-space
Plugin 'jistr/vim-nerdtree-tabs'
" extended javascript syntax
"Bundle 'jelera/vim-javascript-syntax'
" extended javascript syntax
" Plugin 'pangloss/vim-javascript'
" javascript indent
" Plugin 'vim-scripts/JavaScript-Indent'
" vcs info on gutter
Plugin 'mhinz/vim-signify'
" sass syntax
" Plugin 'cakebaker/scss-syntax.vim'
" file finder
Plugin 'kien/ctrlp.vim'
" show tabs when expandtabs is on
Plugin 'Yggdroot/indentLine'
" syntax checker
Plugin 'scrooloose/syntastic'
" auto brackets
Plugin 'Raimondi/delimitMate'
" mercurial plugin
" Plugin 'phleet/vim-mercenary'
" extended statusbar
Plugin 'bling/vim-airline'
" terminal inside vim
Plugin 'rosenfeld/conque-term'
" Ag searcher (needs silversearcher-ag)
"Bundle 'ervandew/ag'
Plugin 'rking/ag.vim'
" code completion
"Bundle 'Valloric/YouCompleteMe'
" code completion
Plugin 'Shougo/neocomplcache.vim'
" match html tags
"Bundle 'gregsexton/MatchTag'
" coffee sscript
" Plugin 'kchmck/vim-coffee-script'
" Color scheme gui only
Plugin 'lsdr/monokai'

Plugin 'ciaranm/detectindent'
" Plugin 'digitaltoad/vim-jade'

" Plugin 'szw/vim-ctrlspace'
Plugin 'majutsushi/tagbar'

" Plugin 'vim-scripts/lh-vim-lib'
" Plugin 'LucHermitte/local_vimrc'

Plugin 'editorconfig/editorconfig-vim'

" solarized colorscheme
"Bundle 'altercation/vim-colors-solarized'

" colorscheme scroller
Plugin 'ScrollColors'

" neocomplcache might need this
Plugin 'vim-scripts/dbext.vim'


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
set bs=2

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.dust set filetype=html
au BufNewFile,BufRead *.jade set filetype=jade
au BufNewFile,BufRead *.scala set filetype=scala

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType perl setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType scala setlocal shiftwidth=2 tabstop=2 expandtab

set incsearch
set hlsearch
set ignorecase
set smartcase

set tags=.tags

set t_Co=256
set laststatus=2
set cursorline
set lazyredraw

" Mappings

cab W w
cab Q q
cab Wq wq

map <C-n> :tabnew<CR>
map <C-k> :NERDTreeTabsToggle<CR>
map <F2> :set invlist<CR>:IndentLinesToggle<CR>
map <F4> :SignifyToggle<CR>
map <F6> :split<CR>:ConqueTerm zsh<CR>
map <F9> :tabnew<CR>:ConqueTerm npm test<CR>
map <C-F6> :vsplit<CR>:ConqueTerm zsh<CR>

" CtrlP options
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|sass-cache|vagrant|librarian|node)|node_modules)$'

" Airline options
" let g:airline_theme='wombat'
let g:airline_exclude_preview = 1

" Indentline

let g:indentLine_faster = 1
let g:indentLine_char = '┆'
let g:indentLine_color_term = 237
set list lcs=tab:\|\▸

"
let g:signify_vcs_list = [ 'git' ]  
" don't use phpcs even if it is available
" let g:syntastic_php_checkers = ['php']

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
" inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" tagbar
nmap <F8> :TagbarToggle<CR> 

" GUI dependent settings
if has("gui_running")
	colorscheme darcula

	" Remove toolbar
	set guioptions-=T 
	set guioptions-=m
	set guioptions-=L
	set guioptions-=r
	set guioptions-=e
	set guifont=Monaco\ 12
	let g:airline_powerline_fonts=1

	hi CtrlSpaceNormal guifg=#F8F8F2 guibg=#3E3D32
	hi CtrlSpaceSelected guifg=#FD971F guibg=#272822 gui=bold

else
	colorscheme darcula
endif
hi SpecialKey ctermfg=237 guifg=#333333

inoremap <C-F2> vim: expandtab ts=2 sw=2
inoremap <C-F4> vim: expandtab ts=4 sw=4

