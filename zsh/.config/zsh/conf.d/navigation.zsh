# zoxide: `z <part of a folder name>` jumps to the best match from folders you've visited;
# `zi <part>` shows a picker when several match. Plain `cd` keeps working and teaches it.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
