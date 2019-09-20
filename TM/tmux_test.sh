#! /bin/bash

SESSION='tmux-test'

tmux new-session -n main-window -s $SESSION -d bash

tmux send-keys -t $SESSION "cd sw/le-das-integration" C-m
#tmux send-keys -t $SESSION "tmux new-window -n ancillary-window ./interact_tmux.sh" C-m
tmux send-keys -t $SESSION "bash ./interact_tmux.sh" C-m
#tmux send-keys -t $SESSION "tmux show-environment" C-m
tmux attach -t $SESSION