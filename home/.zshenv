# Set user variables based on XDG Base Directory Specification.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
source "$HOME/.cargo/env"
