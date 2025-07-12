#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @simple-dev-tmux_theme 2>/dev/null)"
TRANSPARENT_THEME="$(tmux show-option -gv @simple-dev-tmux_transparent 2>/dev/null)"

case $SELECTED_THEME in
*)
  #Default Theme
  declare -A THEME=(
    ["background"]=colour235
    ["foreground"]=colour231
    ["black"]=colour0
    ["white"]=colour231
    ["red"]=colour1
    ["yellow"]=colour220
    ["green"]=colour34
    ["mode-fg"]=colour39
    ["mode-bg"]=colour8
    ["message-fg"]=colour82
    ["message-bg"]=colour8
    ["command-fg"]=colour82 
    ["command-bg"]=colour8
    ["pane-border"]=colour8
    ["pane-active"]=colour46
    ["prefix-inactive"]=colour33
    ["prefix-active"]=colour166 
    ["window-inactive"]=colour250
    ["window-active"]=colour231
    ["window-last-flag"]=colour226
  )
  ;;
esac

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

THEME['ghgreen']=colour34 #"#3fb950"
THEME['ghmagenta']=colour141 #"#A371F7"
THEME['ghred']=colour160 #"#d73a4a"
THEME['ghyellow']=colour181 #"#d29922"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
