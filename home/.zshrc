export PATH="/usr/local/bin:$PATH"
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors
colors

# bash completion
autoload -U bashcompinit
bashcompinit
source ~/.zsh.d/template-completion.bash

setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd
function chpwd() { ls }

setopt hist_ignore_dups

case "${OSTYPE}" in
darwin*)
  alias -g C='| pbcopy'

  alias g='git'

  alias ls="ls -Gh"
  alias ll="ls -lGh"
  alias la="ls -laGh"
  alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
  alias man='env LANG=C man'
  alias jman='env LANG=ja_JP.UTF-8 man'
  alias p3='python3'
  alias svndel="svn status | grep '^!' | awk '{print \$2}' | xargs svn delete"

  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

  alias neologd="mecab -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd"
  alias jumandic="mecab -d /usr/local/Cellar/mecab-jumandic/5.1-20070304/lib/mecab/dic/jumandic"
  alias uni="mecab -d /usr/local/Cellar/mecab-unidic/2.1.2/lib/mecab/dic/unidic"
  alias ipa="mecab -d /usr/local/Cellar/mecab-ipadic/2.7.0-20070801/lib/mecab/dic/ipadic.old"

  export CPATH="$CPLUS_LIBRARY_PATH:/usr/local/include:/usr/include"
  export ANDROID_HOME="~/Library/Android/sdk"
  export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
  export PATH="$PATH:/Users/$USER/local/bin:/Users/$USER/tools/maven-3.0.5/bin"
  export PATH="$PATH:/Applications/Inkscape.app/Contents/Resources/bin"
  export PATH="$PATH:/Users/$USER/local/bin"
  export PATH="$PATH:/usr/local/opt/gettext/bin"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home"
  # export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
  eval "$(rbenv init -)"
  precmd () { print -Pn "\e]2;%n@%M | %~\a" } # title bar prompt
  ;;

linux*)
  alias g='git'

  alias ls='ls -h --color'
  alias ll='ls -lh --color'
  alias la='ls -lah --color'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  alias ar='sudo apt-get autoremove'
  alias aup='sudo apt-get update'
  alias aug='sudo apt-get upgrade'
  alias ai='sudo apt-get install '
  alias aar='sudo add-apt-repository '

  export PATH="$PATH:/home/$USER/tools/maven-3.0.5/bin:/home/$USER/.openmpi/bin:/home/iwanari/local/git/bin"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/$USER/.openmpi/lib/"
  export JAVA_HOME="/home/$USER/tools/jdk1.7.0_67"
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
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey "^[OH"  beginning-of-line # 'Home'
bindkey "^[OF"  end-of-line       # 'End'
bindkey "^[[3~" delete-char       # 'Delete'

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

### Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$JAVA_HOME/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH"
export EDITOR=vim
