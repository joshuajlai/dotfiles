PS1='\u@\h:\w\$ '

# gpg nonsense
# gpg-connect-agent /bye
GPG_TTY=$(tty)
export GPG_TTY
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
fi

# load rbenv
eval "$(rbenv init -)"

# set up go
export GOPATH=~/Documents/workspace/grindr/go
export PATH=$PATH:$GOPATH/bin:~/bin

# load brew's curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# load custom scripts
export PATH="~/Documents/workspace/grindr/bin:$PATH"

# load openvpn
export PATH=$(brew --prefix openvpn)/sbin:$PATH

# load brew's coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

alias gpg=gpg2
alias vi=vim
alias grindr='cd ~/Documents/workspace/grindr'
alias grindrgo='cd ~/Documents/workspace/grindr/go/src/github.com/grindrllc'
alias current_date="date -u '+%Y-%m-%d %H:%M:%S%z'"
alias clear_dns="sudo killall -HUP mDNSResponder"
alias git_clear_merged="git branch --merged | egrep -v \"(^\*|master|develop)\" | xargs git branch -d"

# added by travis gem
[ -f /Users/joshua/.travis/travis.sh ] && source /Users/joshua/.travis/travis.sh
