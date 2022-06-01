# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LC_CTYPE="en_US.UTF-8"
export VISUAL="vim"
export EDITOR="$VISUAL"
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

#set up Z
. /usr/local/etc/profile.d/z.sh

# OH MY ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_TMUX_AUTOSTART=true
plugins=(git colorize colored-man-pages history npm meteor wd sudo z)
source $ZSH/oh-my-zsh.sh


# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=`npm config get prefix`/bin:$PATH
export PATH=~/.mongodb/versions/mongodb-current/bin:$PATH

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
alias gss='git status -s'
alias grhh='git reset --hard head'
alias mni='meteor npm install'
alias mns='meteor npm start'
unalias m #get rid of automatic meteor alias
alias goyo="vim -c ':Mgoyo'"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias notes='mvim ~/Dropbox/notes'
alias ctags_js='ctags --options=$HOME/dotfiles/ctags-js -R .'
alias md_to_rte='pandoc -f markdown_mmd -t rtf -s'
alias agenda='gcalcli agenda'
alias sptd='spotifyd --no-daemon'

bindkey "^[^[[D" backward-word 
bindkey "^[^[[C" forward-word

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mike/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mike/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/completion.zsh.inc'; fi

# source any customizations you don't want in the dotfiles repo
source ~/.local/zshrc.local

# for pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


function pretty_csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less -#2 -N -F -S -X -K
}

function code {
	tmux split-window -h -c `pwd`
	tmux split-window -h -c `pwd`
	tmux select-layout main-horizontal
	tmux resize-pane -D 10 
	vim .
}
