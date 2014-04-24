export PATH="/usr/local/bin:$PATH"

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors
colors

setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd

setopt hist_ignore_dups

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
  alias man='env LANG=C man'
  alias jman='env LANG=ja_JP.UTF-8 man'
  ;;
  
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  
  alias ar='sudo apt-get autoremove'
  alias aup='sudo apt-get update'
  alias aug='sudo apt-get upgrade'
  alias ai='sudo apt-get install '
  alias aar='sudo add-apt-repository '
  ;;
esac

### PROMPT ###
PROMPT="%{$fg[cyan]%}[ %n@%m ] %{$fg[green]%}%c%{$fg[magenta]%}# %{$reset_color%}"
RPROMPT="%{$fg[red]$bg[white]%} %d %{$reset_color%}"
setopt TRANSIENT_RPROMPT
setopt LIST_PACKED
setopt ALWAYS_TO_END
setopt PRINT_EIGHT_BIT
#PROMPT="%{$fg[red]%}%m%{$fg[white]%}:%{$fg[green]%}%n%{$fg[white]%}:%{$fg[blue]%}%~%{$fg[white]%}$%{$reset_color%} "

### Key Bindings ###
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

bindkey "^[OH"  beginning-of-line # 'Home'
bindkey "^[OF"  end-of-line       # 'End'
bindkey "^[[3~" delete-char       # 'Delete'

zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

### Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

