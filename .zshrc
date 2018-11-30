# Teladoc ENV
source $HOME/.teladoc_env.zsh

# tiny care term
source $HOME/.tinycare.zsh

# Some secrety things
source $HOME/.keys.zsh

# My ENV
export PATH=$PATH:$HOME/bin
export EDITOR='nvim'
export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml
source "`brew --prefix`/etc/grc.bashrc"
export PATH="$PATH:`yarn global bin`"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export DEVPASS="test"

# Begin Antigen Setup
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply
# End Antigen Setup

# asdf setup
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash 

# aliases
alias -g sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias zshrc='nvim $HOME/.zshrc'
alias vpn="sudo openconnect webvpn.teladochealth.com --csd-user=apaxton --csd-wrapper=$HOME/.cisco/wrapper.sh --user=apaxton@teladoc.com --authgroup='TDH-Okta-VPN' --servercert sha256:019dcc8bf6b3cc429f9204d926bb937a10e75f5e5baf15e14cb93bb3f90e9335"
eval "$(thefuck --alias)"
alias rake="noglob bundle exec rake"
alias be='title ${PWD##*/} && bundle exec' 
alias gmm="git stash && git fetch origin && git merge origin/master && git stash pop"
alias nvimrc='nvim $HOME/.config/nvim/init.vim'
alias dotfile="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias shakes="${HOME}/bin/shakes.py"
alias nvim='title ${PWD##*/} && nvim'
alias dc="docker-compose"
alias dr="docker-compose --rm"
alias datafart='curl --data-binary @- datafart.com'
alias -g rb="noglob rb"

function samlsha1 {
  echo $1 | sha1sum | awk '{print toupper($1)}' | fold -w2 | paste -sd':' -
}

function lowercase-files-in-cd {
  for f in *; do mv "$f" "$f.tmp"; mv "$f.tmp" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done
}

function git-lowercase-files-in-cd {
  for f in *; do git mv "$f" "$f.tmp"; git mv "$f.tmp" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


