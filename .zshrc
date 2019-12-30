export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:Users/vovo/.local/bin"
export TERM=xterm-256color


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/vovo/.oh-my-zsh"

alias vi="/usr/local/bin/vim"


ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh


alias gs="git status"
alias gcm="git commit -m"
alias gaa="git add ."


prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

prompt_dir(){
  prompt_segment blue $CURRENT_FG '%2~'
}

source /Users/vovo/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# this is for pycharm error ValueError: unknown locale:UTF-8 in Python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/opt/gettext/bin:$PATH"

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

