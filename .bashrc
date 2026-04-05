# .bashrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# https://github.com/r3tex/one-dark
# https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
F_BLUE='38;2;97;175;239'
F_CYAN='38;2;86;182;194'
F_GREEN='38;2;152;195;121'
F_PURPLE='38;2;198;120;221'
F_RED='38;2;224;108;117'
F_DARK_RED='38;2;190;80;70'
F_WHITE='38;2;171;178;191'
F_YELLOW='38;2;229;192;123'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

##
# Go
##
export GOPATH=~/go

##
# powerline-go
##

# prefer GOPATH and fallback to `powerline-go` from `PATH``
if [[ -x "$GOPATH/bin/powerline-go" ]]; then
    POWERLINE_BIN="$GOPATH/bin/powerline-go"
elif ! POWERLINE_BIN="$(type -P "powerline-go")"; then
    # give up :'(
    POWERLINE_BIN="not_found"
fi

function _update_ps1() {
    PS1="$(${POWERLINE_BIN} \
        -modules "venv,host,ssh,cwd,perms,git,hg,jobs,exit,root" \
        -hostname-only-if-ssh \
        -error $? \
        -jobs $(jobs -p | wc -l))"
}

if [ "$TERM" != "linux" ] && [ "${POWERLINE_BIN}" != "not_found" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

##
# Aliases
## 

alias ..="cd .."
alias s="git status"
alias d="git diff"
alias gcm="git checkout main"
alias gb="git branch"
alias doco="docker-compose"

export TERM=xterm-256color
