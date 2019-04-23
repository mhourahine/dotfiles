CLICOLOR=1
LSCOLORS=ExFxCxDxBxegedabagacad
LC_CTYPE="en_US.UTF-8"
VISUAL=vim
EDITOR="$VISUAL"
TERM="xterm-256color"
ACKRC=".ackrc"  #allow for per directory ack settings
FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'

# OH MY ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs ssh dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
ZSH_TMUX_AUTOSTART=true
plugins=(git colorize colored-man-pages history last-working-dir osx npm meteor wd sudo tmux z zsh_reload)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/.mongodb/versions/mongodb-current/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=`npm config get prefix`/bin:$PATH

#source ~/.rvm/scripts/rvm

# script to add ssh keys to ssh-agent
#~/.ssh/addkeys.sh

alias ls="ls -F"
alias du="du -h"
alias df="df -h"
alias mongod="mongod run --config /usr/local/etc/mongod.conf"
alias pw_list="cat ~/.things.cpt | ccrypt -d"
alias pw_find="cat ~/.things.cpt | ccrypt -d | grep"
alias pw="ccrypt -d .things.cpt && vim .things && ccrypt .things"
alias gifit="~/dotfiles/gifit"
alias gbr='git branch | grep -v "develop" | xargs git branch -D'
alias goyo="vim -c ':Mgoyo'"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias notes='cd ~/Dropbox/notes && vim .'
alias ctags_js='ctags --options=$HOME/dotfiles/ctags-js -R .'

bindkey "^[^[[D" backward-word 
bindkey "^[^[[C" forward-word

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mike/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mike/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/completion.zsh.inc'; fi

# source any customizations you don't want in the dotfiles repo
source ~/.local/zshrc.local

