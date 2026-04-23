#######################
#       Common        #
#######################
autoload -Uz compinit; compinit
autoload -U bashcompinit; bashcompinit


#######################
#     OS Specific     #
#######################
case "$OSTYPE" in
  darwin*)
  ;;

  linux*)
  ;;

  *)
  ;;
esac

