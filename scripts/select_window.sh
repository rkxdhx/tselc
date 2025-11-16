#!/usr/bin/env bash

LIST_FORMAT="#{window_name} #{pane_current_path} #{pane_current_command}"
PREVIEW_CMD=""

tmux list-windows -F "#{window_id}: $LIST_FORMAT" | fzf-tmux --preview-window=right,70% --border -p 80%,80% --preview "echo '{}' | sed 's/: .*$//' | xargs -I _ tmux capture-pane -ep -t _" | awk -F ':' '{print $1}' | xargs -I _ tmux select-window -t _

