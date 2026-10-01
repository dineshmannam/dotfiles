# Reuse a single ssh-agent across shells instead of spawning a new one each time
if ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
  ssh-agent -s > "$HOME/.ssh-agent-env"
fi
[[ -f "$HOME/.ssh-agent-env" ]] && source "$HOME/.ssh-agent-env" >/dev/null
