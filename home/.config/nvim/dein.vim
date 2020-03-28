"########################
"#       dein.vim       #
"########################
let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim'))
let g:dein_cache = get(g:, 'dein_cache', expand('~/.cache/dein'))

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(g:dein_cache)
  call dein#begin(g:dein_cache)

  call dein#load_toml(g:vim_home.'/dein.toml', {'lazy': 0})
  call dein#load_toml(g:vim_home.'/dein_lazy.toml', {'lazy': 1})

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
