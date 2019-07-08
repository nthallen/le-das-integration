#! /bin/bash

SESSION='tmux-test'

tmux new-session -n main-window -s $SESSION -d
tmux send-keys -t $SESSION "tmux new-window -n ancillary-window" C-m
tmux send-keys -t $SESSION "tmux split-window -h" C-m
#tmux send-keys -t $SESSION "tmux bfr -v" C-m
tmux attach -t $SESSION

#tmux send-keys 'new-window -n ancillary-window'