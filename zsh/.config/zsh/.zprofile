eval "$(/opt/homebrew/bin/brew shellenv)"

# Prefer the self-updating native Claude Code build over the Homebrew cask.
typeset -U path
path=("$HOME/.local/bin" $path)
export PATH
