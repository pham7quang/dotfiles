export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# virtual env wrapper
export VIRTUALENVWRAPPER_PYTHON=`which python3`
export VIRTUALENV_PYTHON=`which python3`
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
