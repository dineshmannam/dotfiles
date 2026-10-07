# fzf: fuzzy pickers in the shell. Type a few letters, Enter picks.
#   Ctrl-R  search command history
#   Ctrl-T  insert a file path (searches below the current folder)
#   Alt-C   cd into a subfolder (left Option key in WezTerm)
#   zi      zoxide's picker over folders you have visited (uses fzf)
if command -v fzf >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"
  if command -v fd >/dev/null 2>&1; then
    # fd is faster than find and skips .git, node_modules and other ignored paths.
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
  fi
  source <(fzf --zsh)
fi
