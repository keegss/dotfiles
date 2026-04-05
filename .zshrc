# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias ..="cd .."

alias s="git status"
alias gb="git branch"
alias d="git diff"
alias gaa="git add ."
alias gcm="git checkout main"
alias gpom="git pull origin main"

alias dc="docker-compose"

alias vi="nvim"
alias is='cd /Users/kconway41/work'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reload-zshrc="source ~/.zshrc"
alias kini='kinit --keychain kconway41@ADDEV.BLOOMBERG.COM'

alias godev='ssh IAMGD-PW-621'

# Squash all commits on current branch into one relative to main
gsquash() {
  local msg="${1:-$(git log --format=%s $(git merge-base HEAD origin/main)..HEAD | tail -1)}"
  git fetch origin main
  git reset --soft $(git merge-base HEAD origin/main)
  git commit -m "$msg"
  git push --force-with-lease
}

# brew
if [[ "$(uname)" == "Darwin" ]]; then                                                                                                                
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi 

# For cookiecutter
export PATH=$HOME/.local/bin:$PATH

# go stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# oh my zsh stuff

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/node-v22.14.0-linux-x64/bin:$PATH"
export PATH="$HOME/.local/node-v22.14.0-linux-x64/bin:$PATH"
