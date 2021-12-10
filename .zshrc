export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# needed to get pyenv working when switching python versions
eval "$(pyenv init -)"

# virtual env wrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
# export VIRTUALENVWRAPPER_PYTHON=`which python3`
# export VIRTUALENV_PYTHON=`which python3`
export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
pyenv virtualenvwrapper_lazy

bindkey -v
bindkey '^R' history-incremental-search-backward

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

alias gcact='gcloud config configurations activate'
alias gclist='gcloud config configurations list'
alias gconfig='gcloud config configurations'

export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
alias java11='export JAVA_HOME=$JAVA_11_HOME'

export PATH="$HOME/.poetry/bin:/Users/quangpham/.pyenv/shims:/Users/quangpham/.nvm/versions/node/v13.7.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/quangpham/.pyenv/shims:/Users/quangpham/.nvm/versions/node/v13.7.0/bin"
# export PATH="/Users/quangpham/.virtualenvs/deployment/bin:$HOME/.poetry/bin:/Users/quangpham/.pyenv/shims:/Users/quangpham/.nvm/versions/node/v13.7.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/quangpham/.pyenv/shims:/Users/quangpham/.nvm/versions/node/v13.7.0/bin"

# # terraform autocomplete
# autoload -Uz compinit
# compinit
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform


# export PATH="$HOME/.poetry/bin:$PATH"
