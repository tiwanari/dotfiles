#######################
#       Common        #
#######################
export EDITOR=vim

export PATH=/usr/local/bin:$PATH

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

eval "$(rbenv init -)"


#######################
#     OS Specific     #
#######################
case "$OSTYPE" in
  darwin*)
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/"
    export PATH="$PATH:$JAVA_HOME/bin"
  ;;

  linux*)
  ;;

  *)
  ;;
esac

