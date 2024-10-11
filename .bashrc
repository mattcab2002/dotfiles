if [ -f "$HOME/bash_profile.sh" ]; then
	. "$HOME/bash_profile"
fi

alias vim="nvim"
alias v="nvim"
alias nc="cd ~/.config/nvim/"
alias notes="cd ~/github/notes/"
alias av="ansible-vault"

export PS1='\[\e[38;5;203m\]\w\[\e[m\] \$ '

set -o vi
