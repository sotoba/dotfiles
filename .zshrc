# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.7.1
export KCODE=u
setopt print_eight_bit

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh

  ## zgen default plugins
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  ## zgen plugins
  zgen load unixorn/autoupdate-zgen
  zgen load zsh-users/zsh-completions

  ## zsh themes
  zgen load romkatv/powerlevel10k powerlevel10k

  # generate the init script from plugins above
  zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# add fucking completions
eval $(thefuck --alias)

# alias
## gnu utils alias
alias xargs='gxargs'
alias find='gfind'
alias sed='gsed'
alias diff='colordiff'

alias beck='bundle exec kitchen'
alias nv='nvim'
alias ash='ssh -F ~/.ssh/assh_config'
alias ku='kubectl'
alias kux='kubectx'
alias kuns='kubens'

# function
gd() {
  DIR=$(ghq list -p | peco --prompt "GIT REPOSITORY>")
  [ -n "$DIR" ] && cd $DIR
}

gs() {
  git branch | peco --prompt "GIT BRANCH>" | head -n 1 | xargs git switch
}

gsc() {
  git switch -c $1
}
