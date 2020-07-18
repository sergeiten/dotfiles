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
