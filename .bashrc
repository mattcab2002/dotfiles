if [ -f "$HOME/.bash_profile" ]; then
    . "$HOME/.bash_profile"
else
    echo "Unable to find bash_profile..."
fi

# aliases
alias vim="nvim"
alias v="nvim"
alias notes="cd ~/github/notes/"
alias av="ansible-vault"
alias mkpasswd="openssl rand -base64 12"

# misc.
set -o vi

# exports
export PS1='\[\e[38;5;39m\]\u@\h:\w \$ \[\e[0m\]'
export BASH_SILENCE_DEPRECATION_WARNING=1
