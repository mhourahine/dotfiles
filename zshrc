# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "agkozak/zsh-z"

# force emacs key bindings
bindkey -e

# make up and down arrows use history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LC_CTYPE="en_US.UTF-8"
export VISUAL="nvim"
export EDITOR="$VISUAL"
# export TERM="xterm-256color"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

if [[ $(uname -v) == *Ubuntu* ]]; then
	# fnm
	export PATH="/home/ubuntu/.local/share/fnm:$PATH"
	eval "`fnm env`"
	export PATH=/home/ubuntu/.meteor:$PATH
else
	# assume macos by default
	export PATH=/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:$PATH
	export PATH=`npm config get prefix`/bin:$PATH
	export PATH=~/.mongodb/versions/mongodb-current/bin:$PATH

	alias notes='mvim ~/Dropbox/notes'
	alias restart_karabiner='sudo killall -mv ".*[k|K]arabiner.*"'
fi

# for n node package manager
export N_PREFIX="$HOME/.n"
export PATH="$N_PREFIX/bin:$PATH"

alias ls="ls -F"
alias du="du -h"
alias df="df -h"
alias gbr='git branch | grep -v "develop" | xargs git branch -D'
alias gss='git status -s'
alias grhh='git reset --hard head'
alias mni='meteor npm install'
alias mns='meteor npm start'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ctags_js='ctags --options=$HOME/dotfiles/ctags-js -R .'
alias md_to_rte='pandoc -f markdown_mmd -t rtf -s'
alias agenda='gcalcli agenda'
alias sptd='spotifyd --no-daemon'
alias notes='nvim ~/Dropbox/notes'
alias history='history 1'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mike/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mike/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mike/google-cloud-sdk/completion.zsh.inc'; fi

# source any customizations you don't want in the dotfiles repo
source ~/.local/zshrc.local

function pretty_csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less -#2 -N -F -S -X -K
}

function setmongopw {
	echo -n "MongoDB Password: "
	read -s MONGO_PWD
	export MONGO_PWD
	echo
}

function code {
	tmux split-window -h -c `pwd`
	tmux split-window -h -c `pwd`
	tmux select-layout main-horizontal
	tmux resize-pane -D 10 
	tmux renamew `basename "$PWD"`
	nvim .
}

export DEV_IP=3.85.32.98
function devtunnel {
  local ip="${1:-$DEV_IP}"

	# Rename the current window to 'tunnels'
	tmux rename-window "tunnels"

	# Start in current pane: webapp tunnel
	tmux send-keys "echo 'Starting webapp tunnel...'" C-m
	tmux send-keys "ssh -i ~/.ssh/mike-aws-dev.pem ubuntu@$ip -N -L 3000:localhost:3000" C-m

	# Split horizontally for mongod tunnel
	tmux split-window -h
	tmux send-keys "echo 'Starting mongod tunnel...'" C-m
	tmux send-keys "ssh -i ~/.ssh/mike-aws-dev.pem ubuntu@$ip -N -L 3001:localhost:3001" C-m

	# Move to the left pane and split vertically for maildev tunnel
	tmux select-pane -L
	tmux split-window -v
	tmux send-keys "echo 'Starting maildev tunnel...'" C-m
	tmux send-keys "ssh -i ~/.ssh/mike-aws-dev.pem ubuntu@$ip -N -L 1080:localhost:1080" C-m

	# Arrange the layout nicely
	tmux select-layout tiled
}
