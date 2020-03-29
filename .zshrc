export ZSH=~/.oh-my-zsh
export LC_ALL=en_US.UTF-8

ZSH_THEME="dracula"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="spaceship"

plugins=(git bundler osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dev="cd  ~/Developer"
alias godev="cd ~/Developer/go"
#alias v="/usr/local/Cellar/vim/8.1.1300/bin/vim"
alias v="/usr/local/Cellar/neovim/0.4.3/bin/nvim"
alias vim="/usr/local/bin/mvim"
alias gt="git status"
alias t="tree"
alias vc="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias dev-tmux="~/dev-tmux"
alias ctags="`brew --prefix`/bin/ctags"
alias webstorm="/Applications/WebStorm.app/Contents/MacOS/webstorm"
alias phpstorm="/Applications/PhpStorm.app/Contents/MacOS/phpstorm"
alias goland="/Applications/GoLand.app/Contents/MacOS/goland"
alias pycharm="/Applications/PyCharm.app/Contents/MacOS/pycharm"

export GOPATH=${HOME}/Developer/go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=${GOPATH}/bin:/usr/local/opt/libiconv/bin:$PATH
export PATH=${HOME}/Developer/go/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
	prompt_segment black default "%(!.%{%F{yellow}%}.)"
  fi
}

prompt_dir() {
  prompt_segment blue black '%.'
}

# iTerm2 window/tab color commands
#   Requires iTerm2 >= Build 1.0.0.20110804
#   http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

# Change the color of the tab when using SSH
# reset the color after the connection closes
color-ssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ "$*" =~ "production|ec2-.*compute-1" ]]; then
            tab-color 255 0 0
        else
            tab-color 0 255 0
        fi
    fi
    ssh $*
}
compdef _ssh color-ssh=ssh

#alias ssh=color-ssh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# To apply the command to CTRL-T as well
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

export GPG_TTY=$(tty)
export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Ruby env
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

export PATH="/usr/local/opt/llvm/bin:$PATH"
