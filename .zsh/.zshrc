foreach piece (
    load.zsh
    exports.zsh
    propmt.zsh
    settings.zsh
    aliases.zsh
    widgets.zsh
    mappings.zsh
	plugins.zsh
) {
	source $ZDOTDIR/config/$piece
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. "$HOME/.cargo/env"
