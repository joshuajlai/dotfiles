PS1='\u@\h:\w\$ '
GPG_TTY=$(tty)
export GPG_TTY

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
fi
export PINENTRY_USER_DATA="USE_CURSES=1"
