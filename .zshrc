# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/nathan/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# DISABLE_AUTO_UPDATE="true"

bindkey '^ ' autosuggest-accept

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Custom

export SPICETIFY_INSTALL="/home/nathan/spicetify-cli"
export PATH="$HOME/.cargo/bin:/snap/bin:$SPICETIFY_INSTALL:$PATH" 
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR="/usr/bin/vim"

alias ls="/opt/coreutils/bin/ls"
alias l="ls"
alias la="ls -A"
alias ll="ls -lh"
alias lt="exa -T"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias sudo='sudo '

alias ai="sudo apt install"
alias ar="sudo apt remove"
alias au="sudo apt update"
alias as="apt search"

alias svim="sudo -e"

alias cat="bat"

alias e="exit"

alias python="python3"
alias pip="pip3"
alias password="python3 -c 'import os; print(os.urandom(24).hex())'"
alias cm="python3 -m connectionmaster"

alias live="less +F"

alias my="mariadb"

alias open="google-chrome"

alias weather="curl wttr.in/portland"

mkcd() {
	mkdir $1
	cd $1
}

cl() {
	cd $1
	ls
}

template() {
	if [ -z "$1" ]; then
		echo 'Please enter a template name'
	elif [ -n "$2" ]; then
		cp -r ~/templates/$1 $2
	else
		cp -r ~/templates/$1 $1
	fi
}

pypiu() {
	python3 setup.py sdist bdist_wheel
	twine upload dist/*
}

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias)
