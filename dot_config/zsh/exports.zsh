#######################
#       Common        #
#######################
export EDITOR=vim

export PATH=/usr/local/bin:$PATH

export PATH=/Library/TeX/texbin:$PATH
export PATH=/usr/local/texlive/2025/bin/universal-darwin:$PATH

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init -)"
eval "$(rbenv init -)"

#######################
#     OS Specific     #
#######################
case "$OSTYPE" in
  darwin*)
    export PATH=/opt/homebrew/opt/openjdk/bin:$PATH
  ;;

  linux*)
  ;;

  *)
  ;;
esac

