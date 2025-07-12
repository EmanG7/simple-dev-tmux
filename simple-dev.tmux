#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_PATH="$CURRENT_DIR/scripts"

source $SCRIPTS_PATH/themes.sh

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
#Highlight colors
tmux set -g mode-style "fg=${THEME[mode-fg]},bg=${THEME[mode-bg]}"

tmux set -g message-style "fg=${THEME[message-fg]},bg=${THEME[message-bg]}"
tmux set -g message-command-style "fg=${THEME[command-fg]},bg=${THEME[command-fg]}"

tmux set -g pane-border-style "fg=${THEME[pane-border]}"
tmux set -g pane-active-border-style "fg=${THEME[pane-active]}"
tmux set -g pane-border-status off

tmux set -g status-style bg="${THEME[background]}"

git_status="#($SCRIPTS_PATH/git-status.sh #{pane_current_path})"
wb_git_status="#($SCRIPTS_PATH/wb-git-status.sh #{pane_current_path} &)"
datetime="$($SCRIPTS_PATH/datetime.sh)"

#Status Bar Settings
tmux set -g status-justify left
tmux set -g status-left-length 10
tmux set -g status-right-length 50
tmux set -g window-status-separator ""

#Status Bar - Left
tmux set -g status-left "$RESET#[bg=${THEME[black]}]#{?client_prefix,#[fg=${THEME[prefix-active]}],#[fg=${THEME[prefix-inactive]}]}"
tmux set -ag status-left "$RESET#[fg=${THEME[white]}]#{?client_prefix,#[bg=${THEME[prefix-active]}],#[bg=${THEME[prefix-inactive]}]}  #S "
tmux set -ag status-left "$RESET#[bg=default]#{?client_prefix,#[fg=${THEME[prefix-active]}],#[fg=${THEME[prefix-inactive]}]}"

#Window
#Focus
tmux set -g window-status-current-format "$RESET#[fg=${THEME[window-active]}] 󰫢 #I:#W"
#Unfocused
tmux set -g window-status-format "$RESET#{?window_last_flag,#[fg=${THEME[window-last-flag]}] 󰁯 ,#[fg=${THEME[window-inactive]}]  }$RESET#[fg=${THEME[window-inactive]}]#I:#W"

#Status Bar - Right
tmux set -g status-right "$RESET$git_status$wb_git_status$datetime"

if [ "$(tmux show-option -gv @simple-dev-tmux_transparent 2>/dev/null)" != 1 ]; then
tmux set -ag status-right "#[fg=${THEME[background]},bg=${THEME[black]}]"
fi




