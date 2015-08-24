#!/usr/bin/zsh

readonly MC_SESSION="minecraft"
readonly MC_COMMAND=""

function mc-run
{
  if tmux has-session -t "$MC_SESSION" &>/dev/null; then
    tmux attach-session -t "$MC_SESSION"
  else
    tmux new-session -n control -s "$MC_SESSION" "$MC_COMMAND"
  fi
}

function mc-stop
{
  if tmux has-session -t "$MC_SESSION" &>/dev/null; then
    echo -n "Stopping minecraft session..."
    tmux send-keys -t "$MC_SESSION" -l /stop
    tmux send-keys -t "$MC_SESSION" Enter
    while tmux has-session -t "$MC_SESSION" &>/dev/null; do sleep 1; done
    echo "\tStopped."
  fi
  return 0
}

function mc-restart
{
  mc-stop && mc-run
}
