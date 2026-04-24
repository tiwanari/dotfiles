#######################
#       Common        #
#######################
export EDITOR=nvim

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH=/usr/local/bin:$PATH

export PATH=/Library/TeX/texbin:$PATH
export PATH=/usr/local/texlive/2025/bin/universal-darwin:$PATH

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

command -v pyenv > /dev/null && eval "$(pyenv init -)"
command -v rbenv > /dev/null && eval "$(rbenv init -)"

