###############################
#       Prompt Settings       #
###############################
autoload -U promptinit; promptinit
prompt pure


###############################
#           Exports           #
###############################
. $ZDOTDIR/exports.zsh


###############################
#         Completions         #
###############################
. $ZDOTDIR/completions.zsh


###############################
#           Aliases           #
###############################
. $ZDOTDIR/aliases.zsh


###############################
#        Key  Bindings        #
###############################
. $ZDOTDIR/keybindings.zsh


###############################
#       History  Config       #
###############################
HISTFILE=$ZDOTDIR/history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_all_dups     # Remove the old one
setopt hist_ignore_space        # Ignore commands starting with spaces
setopt hist_verify              # edit before executing a command from history
setopt hist_reduce_blanks       # save commands after removing redundant spaces
setopt hist_save_no_dups        # Ignore same commands
setopt hist_no_store            # Ignore history command itself
setopt hist_expand              # automatically expand history
setopt inc_append_history       # search history incrementally


function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
bindkey "^S" history-incremental-search-forward


###############################
#        Misc Settings        #
###############################
setopt auto_cd
function chpwd() { ls }

autoload -Uz colors; colors # colors


