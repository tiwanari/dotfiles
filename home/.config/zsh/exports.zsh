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
    # export JAVA_HOME=`/usr/libexec/java_home -v 10`
    # export JAVA_HOME=`/usr/libexec/java_home -v 9`
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    # export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    # export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
    export PATH="$PATH:$JAVA_HOME/bin"
    export PATH=/usr/local/opt/openjdk/bin:$PATH
  ;;

  linux*)
  ;;

  *)
  ;;
esac

