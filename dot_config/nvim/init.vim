"########################
"#       init.vim       #
"########################
let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim'))

if &compatible
  set nocompatible
endif

" Encoding {{{
scriptencoding utf8
set encoding=utf-8
set fileencoding=utf-8
language ja_JP
" }}}

" Basic settings {{{
set noswapfile      "
set nobackup        "
set autoread        " autoreload when the file is modified
colorscheme desert  "
" }}}

" Editor {{{
set number              " show line numbers
set cursorline          " highlight the current line
set expandtab           " use spaces as a tab
set tabstop=4 softtabstop=4 shiftwidth=4 " tab width
set smartindent         "
set smarttab            "
set showmatch           " show the paring bracket
set nowrap              " stop wrapping lines
set laststatus=2        " always show the status bar
set clipboard=unnamed   " enable copy to clipboard
set list                        " show invisible characters
set listchars=tab:▸\ ,eol:¬     "
autocmd BufWritePre * :%s/\s\+$//e  " strip trailing spaces
" }}}

" Search {{{
set ignorecase      "
set smartcase       " don't ignore case when searching for a word with a upper case
set incsearch       " incremental search
set wrapscan        " go to the top once reaching the end
set hlsearch        " highlight hits
" }}}

" Folding {{{
set foldenable
set foldmethod=marker
" }}}


"########################
"#       dein.vim       #
"########################
exec 'source' g:vim_home.'/plugins/dein.vim'

filetype plugin indent on   " enable filetype specific indents
syntax enable               " syntax highlight


"########################
"#     key bindings     #
"########################
exec 'source' g:vim_home.'/bindings.vim'

"########################
"#     Dein bindings     #
"########################
" Set Dein base path (required)
let s:dein_base = '/Users/tatsuyaiwanari/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/Users/tatsuyaiwanari/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif

