# Register functions as widgets.
foreach widget (
	# Built-in
	'add-surround surround'
	'delete-surround surround'
	'change-surround surround'
	select-quoted
	select-bracketed

	# Custom
	custom-expand-global-alias
	custom-insert-last-typed-word
	custom-tmux-scroll-up
	custom-fzf-launch-from-history
	custom-fzf-select
    custom-zle-line-init
    custom-zle-keymap-select
) {
	eval zle -N $widget
}
unset widget

# Expand global alias to its full form.
function custom-expand-global-alias() {
    if [[ "$LBUFFER" =~ ' [A-Z0-9]+$' ]] {
        zle _expand_alias
    }

    zle self-insert
}

# Insert last typed word for quick copy-paste.
function custom-insert-last-typed-word() {
    zle insert-last-word -- 0 -1
}

# Activate tmux copy-mode and scroll up depending on key stroke.
function custom-tmux-scroll-up() {
    if (! (( $+commands[tmux] )) || [[ "$TMUX" == '' ]]) {
        return 1
    }

    tmux copy-mode

    # "$KEYS" == ^Y
    if [[ "$KEYS" == ^Y ]] {
        tmux send-keys -X scroll-up

    # "$KEYS" == ^U
    } elif [[ "$KEYS" == ^U ]] {
        tmux send-keys -X halfpage-up
    }
}

# Select command from history into the command line.
function custom-fzf-launch-from-history() {
    if ! (( $+commands[fzf] )) {
        return 1
    }

    setopt LOCAL_OPTIONS NO_GLOB_SUBST NO_POSIX_BUILTINS PIPE_FAIL 2>/dev/null

    local selected=(
        $(
            fc -l 1 \
            | fzf \
                --tac \
                --nth='2..,..' \
                --tiebreak='index' \
                --query="${LBUFFER}" \
                --exact \
                --prompt='$ '
        )
    )

    local stat=$?

    if [[ "$selected" != '' ]] {
        local num=$selected[1]

        if [[ "$num" != '' ]] {
            zle vi-fetch-history -n $num
        }
    }

    zle redisplay

    typeset -f zle-line-init &>/dev/null && zle zle-line-init

    return $stat
}

# Paste the selected files and directories into the command-line.
function custom-fzf-select() {
    if ! (( $+commands[fzf] )) {
        return 1
    }

    local directory=${${(ps: :)LBUFFER}[-1]}
    (! [[ -d "$directory" ]]) && unset directory

    local selected=$(
        find -L ${directory:-'.'} \( -fstype 'dev' -or -fstype 'proc' \) -prune -or -print 2>/dev/null \
        | sed 1d \
        | ([[ -v directory ]] && cat || cut -b 3-) \
        | fzf \
            --prompt='select ' \
            --preview-window='right:60%' \
            --preview=' \
                if [ -d {} ]; then; \
                    ls -l --si --almost-all --classify --color=always --group-directories-first --literal {} 2>/dev/null; \
                else \
                    cat {} 2>/dev/null; \
                fi \
            ' \
    )

    if [[ "$selected" != '' ]] {
        LBUFFER="${LBUFFER//${directory:-}/}${selected}"
    }

    zle redisplay
}

function custom-zle-line-init custom-zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    zle reset-prompt
}

function flutter-watch(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -v \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;\
  resize-pane -y 5 -t 1 \;\
  select-pane -t 0 \;
}
