# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=robbyrussell
#ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git aws brew chucknorris colorize colored-man osx meteor rails ruby rvmsudo wd zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH
export ACKRC=".ackrc"  #allow for per directory ack settings

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LC_CTYPE="en_US.UTF-8"

# script to add ssh keys to ssh-agent
~/.ssh/addkeys.sh

alias ls="ls -F"
alias du="du -h"
alias df="df -h"
alias mongod="mongod run --config /usr/local/etc/mongod.conf"
alias pw_list="cat ~/.things.cpt | ccrypt -d"
alias pw_find="cat ~/.things.cpt | ccrypt -d | grep"
alias pw="ccrypt -d .things.cpt && vim .things && ccrypt .things"
alias python="python3"
alias pip="pip3"

bindkey "^[^[[D" backward-word 
bindkey "^[^[[C" forward-word

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
