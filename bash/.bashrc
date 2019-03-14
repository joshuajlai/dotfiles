# gpg nonsense
# gpg-connect-agent /bye
GPG_TTY=$(tty)
export GPG_TTY
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
fi

# load rbenv
eval "$(rbenv init -)"

# load brew's curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# load custom scripts
export PATH="~/Documents/workspace/randos:$PATH"

# load openvpn
export PATH=$(brew --prefix openvpn)/sbin:$PATH

# load brew's coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

alias gpg=gpg2
alias vi=vim
alias current_date="date -u '+%Y-%m-%d %H:%M:%S%z'"
alias clear_dns="sudo killall -HUP mDNSResponder"
alias git_clear_merged="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"
alias python='python3'

# ruby/rails shortcuts
alias be="bundle exec"
alias rails_create_migration="be rails generate migration"

# brew service shortcuts
alias pg_start='brew services start postgresql'
alias pg_stop='brew services stop postgresql'
alias redis_start='brew services start redis'
alias redis_stop='brew services stop redis'

# kubernetes shortcuts
alias k='kubectl'
alias rerun_job="kubectl patch job my-job --patch '{\"status\":null}'"

# base64 shorthand
alias b64_decode='pbpaste | base64 --decode | pbcopy'
alias b64_encode='pbpaste | base64 -w 0 | pbcopy'
alias b64_print='pbpaste | base64 --decode'

# set up go
# must be last
export PATH=$PATH:$GOPATH/bin:~/bin
