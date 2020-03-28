"########################
"#       init.vim       #
"########################
if &compatible
  set nocompatible
endif

" Encoding
scriptencoding utf8
set encoding=utf-8
set fileencoding=utf-8

" Basic settings
set noswapfile      "
set nobackup        "
set autoread        " autoreload when the file is modified
colorscheme desert  "

" Editor
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
inoremap <silent> jj <ESC>:<C-u>w<CR>   " double 'j' to go back to normal mode and save the file

" Search
set ignorecase      "
set smartcase       " don't ignore case when searching for a word with a upper case
set incsearch       " incremental search
set wrapscan        " go to the top once reaching the end
set hlsearch        " highlight hits
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>   " redraw and disable highlighting hits



"########################
"#       dein.vim       #
"########################
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on   " enable filetype specific indents
syntax enable               " syntax highlight
