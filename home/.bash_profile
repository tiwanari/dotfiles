export PATH=/usr/local/bin:$PATH:/Users/tatsuya/Developer/Android/android-sdk-macosx/tools:/Users/tatsuya/Developer/Android/android-sdk-macosx/platform-tools

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

source ~/.profile

### Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

