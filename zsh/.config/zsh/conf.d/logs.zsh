# logsync: commit new daily and weekly logs in ~/personal/logs, then pull and push.
logsync() {
  local repo="$HOME/personal/logs"
  [[ -d "$repo/.git" ]] || { echo "logsync: $repo is not a git repo" >&2; return 1; }
  git -C "$repo" add -A || return 1
  git -C "$repo" diff --cached --quiet || git -C "$repo" commit -qm "logs: $(date '+%Y-%m-%d %H:%M')" || return 1
  git -C "$repo" pull --rebase --quiet && git -C "$repo" push --quiet && echo "logsync: done"
}
