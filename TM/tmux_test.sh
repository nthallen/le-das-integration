#! /bin/bash

SESSION='tmux-test'

tmux new-session -n main-window -s $SESSION -d
tmux send-keys -t $SESSION "tmux new-window -n ancillary-window" C-m
tmux send-keys -t $SESSION "tmux split-window -v" C-m
tmux send-keys -t $SESSION "tmux last-pane" C-m
tmux send-keys -t $SESSION "ls" C-m
tmux send-keys -t $SESSION "tmux split-window -h" C-m
tmux send-keys -t $SESSION "ls" C-m #top-left
tmux send-keys -t $SESSION "tmux split-window -h" C-m
tmux send-keys -t $SESSION "ls" C-m #bottom
#tmux send-keys -t $SESSION "tmux bfr -v" C-m
tmux attach -t $SESSION

#tmux send-keys 'new-window -n ancillary-window'