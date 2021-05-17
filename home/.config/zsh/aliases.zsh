#######################
#       Common        #
#######################
alias g='git'
alias gclean='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d'

alias vi='nvim'
alias vim='nvim'

# for competitive programming
alias jcm='javac Main.java'
alias jrm='java Main'
alias runall='for f in `ls in_*`; do jrm < $f; done'
alias catall='cat out_*'
alias cpmain='cat main.java | C'



#######################
#     OS Specific     #
#######################
case "$OSTYPE" in
  darwin*)
    alias C='pbcopy'

    alias ls="ls -Gh"
    alias ll="ls -lGh"
    alias la="ls -laGh"

    alias gvim='env LANG=ja_JP.UTF-8 vimr "$@"'

    alias man='env LANG=C man'
    alias jman='env LANG=ja_JP.UTF-8 man'
  ;;

  linux*)
    alias ls='ls -h --color'
    alias ll='ls -lh --color'
    alias la='ls -lah --color'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    # Assuming Ubuntu
    alias ar='sudo apt-get autoremove'
    alias aup='sudo apt-get update'
    alias aug='sudo apt-get upgrade'
    alias ai='sudo apt-get install '
    alias aar='sudo add-apt-repository '
  ;;

  *)
  ;;
esac
